import 'package:app_skin_mate/AppointmentScreens/noAppointment.dart';
import 'package:app_skin_mate/Screens/homePage.dart';
import 'package:app_skin_mate/homePage_profileScreens/userProfile.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int _selectedIndex = 2;

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
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Text("There are no Notifications yet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Color(0xff2A3E49)
                      ),)),
              ),
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
                  /*if(_hasAppointments)
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => listAppointments()));
                  else */
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