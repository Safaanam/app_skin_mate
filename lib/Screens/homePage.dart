import 'package:app_skin_mate/models/Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;
  bool _isSelected = false;
  static const TextStyle optionStyle = TextStyle(color: Color(0xff608597),fontSize: 10, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 88.0, horizontal: 61.0),
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
            GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: services.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 19.5),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    print('clicked');
                    //Navigator.of(context).pushNamed(RouteName.GridViewCustom);
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(services[index].serviceImageUrl),
                        //ImageIcon(AssetImage(services[index].serviceImageUrl)),
                        Text(services[index].serviceName,
                            style:
                                TextStyle(fontSize: 11, color: Color(0xFF759CAD)),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80.0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0),),
            child: BottomNavigationBar(
              backgroundColor: Color(0xFF2B404A),
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  //icon: ImageIcon(AssetImage('asset/images/home.png'),),
                  icon: Icon(Icons.home_outlined, size:35.0),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.event_note_outlined, size:35.0),
                  label: 'Appointment',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_outlined, size:35.0),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_outlined, size:35.0),
                  label: 'Account',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Color(0xff608597),
              onTap: _onItemTapped,
            ),
          ),
      ),
    );
  }
}
