import 'package:app_skin_mate/AppointmentScreens/Models/ServiceTypes.dart';
import 'package:app_skin_mate/AppointmentScreens/Models/listAppointments.dart';
import 'package:app_skin_mate/AppointmentScreens/noAppointment.dart';
import 'package:app_skin_mate/AppointmentScreens/scheduleAppointment.dart';
import 'package:app_skin_mate/homePage_profileScreens/models/Notifications.dart';
import 'package:app_skin_mate/homePage_profileScreens/userProfile.dart';
import 'package:app_skin_mate/models/Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Services>? serviceList;
  bool hasAppointments = true;
  @override
  void initState(){
    super.initState();
  }
  int _selectedIndex = 0;

  void _onItemTapped(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
          //physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 70.0, horizontal: 61.0),
                    child: Container(
                      width: 130.0,
                      height: 40,
                      child: Text(
                        "SkinMate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: 70,
                      height: 90,
                      child: Image.asset('assets/images/logo1.jpg')),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: Text(
                      "Schedule Appointment for"
                      "\n Dermatology Services",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Color.fromARGB(255, 43, 64, 73),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<List<Services>>(
                future: fetchServices(),
                  builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    serviceList = snapshot.data;
                    return GridView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 19.5),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/schedule',  arguments: {'selectedId': serviceList![index].serviceId},);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20.0,right: 20.0),
                              width: 140.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffE5E7E9)),
                                //color: Color(0xffB2BFB8),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(10.0)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                                children: [
                                  //Image.asset(services[index].serviceImageUrl),
                                  //ImageIcon(AssetImage(services[index].serviceImageUrl)),
                                  ImageIcon(AssetImage("assets/images/service" + index.toString() + ".png"),
                                    color: Color(0xff759CAD),
                                    size: 50.0,
                                  ),
                                  Text("${snapshot.data![index].serviceType}",
                                      //services[index].serviceName,
                                      style:
                                      TextStyle(fontSize: 12, color: Color(0xFF759CAD)),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          );
                        });
                  }else if (snapshot.hasError) {
                    return Text("Error");
                  }
                  return Text("Loading...");
                  }
              ),
            ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0),),
          child: BottomNavigationBar(
            backgroundColor: Color(0xFF2B404A),
            type: BottomNavigationBarType.fixed,
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: IconButton(icon: Icon(Icons.home_outlined),
                  iconSize:35.0,
                  onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => homePage()));
                  },
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: IconButton(icon: Icon(Icons.event_note_outlined),
                  iconSize:35.0,
                  onPressed: ()  {
                  if(hasAppointments)
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => listAppointments()));
                  else
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => NoAppointment()));
                  },
                ),
                label: 'Appointment',
              ),
              BottomNavigationBarItem(
                icon: IconButton(icon: Icon(Icons.notifications_none_outlined),
                  iconSize:35.0,
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Notifications()));
                  },
                ),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: IconButton(icon: Icon(Icons.person_outline_outlined),
                  iconSize:35.0,
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => UserProfile()));
                  },
                ),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Color(0xff608597),
            onTap: _onItemTapped,
          ),
        ),
    );
  }
}
