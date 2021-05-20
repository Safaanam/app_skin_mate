import 'package:app_skin_mate/AppointmentScreens/Models/listAppointments.dart';
import 'package:app_skin_mate/AppointmentScreens/scheduleAppointment.dart';
import 'package:app_skin_mate/Screens/homePage.dart';
import 'package:app_skin_mate/homePage_profileScreens/models/Notifications.dart';
import 'package:app_skin_mate/homePage_profileScreens/userProfile.dart';
import 'package:flutter/material.dart';


class NoAppointment extends StatefulWidget {
  @override
  _NoAppointmentState createState() => _NoAppointmentState();
}

class _NoAppointmentState extends State<NoAppointment> {
  int _selectedIndex = 1;
  bool hasAppointments = true;

  void _onItemTapped(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 812.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20.0,top: 60.0),
                child: Container(
                    width: 154.0,
                    height: 120,
                    child: Text("My Appointments",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff112027)
                      ),
                    )
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Container(
                    width: 255.0,
                    height: 224.0,
                    child: Image.asset('assets/user_Profile/no_Appointment.png')
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                    width: 263.0,
                    height: 21.0,
                    child: Text("No Active Appointments !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff25414A)
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: ButtonTheme(
                buttonColor: Color(0xff749BAD),
                child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 57.0,
                  child: RaisedButton(
                    child: Text('SCHEDULE APPOINTMENT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    textColor: Color(0xffFFFFFF),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => scheduleAppoitment()));
                    },
                  ),
                ),
              ),
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
                  if(hasAppointments)
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => listAppointments()));
                  else
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => NoAppointment()));
                  //Navigator.push(context, MaterialPageRoute(builder: (_) => NoAppointment()));
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