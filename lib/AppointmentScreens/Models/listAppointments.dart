import 'package:app_skin_mate/AppointmentScreens/noAppointment.dart';
import 'package:app_skin_mate/Screens/homePage.dart';
import 'package:app_skin_mate/homePage_profileScreens/models/Notifications.dart';
import 'package:app_skin_mate/homePage_profileScreens/userProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class listAppointments extends StatefulWidget {
  @override
  _listAppointmentsState createState() => _listAppointmentsState();
}

class _listAppointmentsState extends State<listAppointments> {
  int _selectedIndex = 1;

  void _onItemTapped(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffECEFF3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 40)

              ),
              ]
          ),
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
