import 'package:app_skin_mate/AppointmentScreens/Models/listAppointments.dart';
import 'package:app_skin_mate/AppointmentScreens/noAppointment.dart';
import 'package:app_skin_mate/Screens/WelcomeScreen.dart';
import 'package:app_skin_mate/Screens/homePage.dart';
import 'package:app_skin_mate/homePage_profileScreens/models/Notifications.dart';
import 'package:app_skin_mate/homePage_profileScreens/models/first_Container.dart';
import 'package:app_skin_mate/homePage_profileScreens/models/second_Container.dart';
import 'package:app_skin_mate/homePage_profileScreens/models/third_Container.dart';
import 'package:app_skin_mate/homePage_profileScreens/user_EditProfile.dart';
import 'package:app_skin_mate/models/local_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isSwitched = true;
  bool hasAppointments = true;
  final storage = FlutterSecureStorage();
  int _selectedIndex = 3;

  void _onItemTapped(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  /*checkBio() async {
    String bio = await storage.read(key: "bio");
    print(bio);
    if(bio == "true") {
      setState(() {
        bool isSwitched = true;
      });
    }
  } */

  @override
  void initState() {
    //checkBio();
  }

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Color(0xffECEFF3),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 60.0),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 102.0,
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => user_EditProfile()));
                    },
                    child: ListTile(
                      leading: Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          child: ClipOval(
                            child: Image(
                              height: 80.0,
                              width: 80.0,
                              image:
                                  AssetImage('assets/user_Profile/person.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        "Safa Anam",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Color(0xff112027),
                        ),
                      ),
                      subtitle: Text(
                        "View / Edit Profile",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff02122C),
                        ),
                      ),
                      trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          iconSize: 30.0,
                          onPressed: () => {}),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                buildFirstContainer(context, 0),
                buildFirstContainer(context, 1),
                SizedBox(height: 10.0),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60.0,
                        child: GestureDetector(
                          onTap: () {
                              /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => WelcomeScreen())); */

                          },
                          child: ListTile(
                            leading: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(),
                              child: CircleAvatar(
                                child: ClipOval(
                                  child: Image(
                                    height: 50.0,
                                    width: 50.0,
                                    image: AssetImage(field2[0].imageUrl!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              field2[0].bodyName!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Color(0XFF112027),
                              ),
                            ),
                            trailing: Switch(value: isSwitched, onChanged: toggleSwitch, activeColor: Colors.blue,)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                buildSecondContainer(context, 1),
                SizedBox(height: 10.0),
                buildThirdContainer(context, 0),
                buildThirdContainer(context, 1),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => WelcomeScreen()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              "Logout",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color(0xffA2071E)),
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            )),
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
