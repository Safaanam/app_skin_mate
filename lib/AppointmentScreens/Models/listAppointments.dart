import 'package:app_skin_mate/AppointmentScreens/Models/Appointment_bottom.dart';
import 'package:app_skin_mate/AppointmentScreens/noAppointment.dart';
import 'package:app_skin_mate/Screens/homePage.dart';
import 'package:app_skin_mate/checkIn_Screens/checkIn_MainScreen.dart';
import 'package:app_skin_mate/homePage_profileScreens/models/Notifications.dart';
import 'package:app_skin_mate/homePage_profileScreens/userProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class listAppointments extends StatefulWidget {
  @override
  _listAppointmentsState createState() => _listAppointmentsState();
}

class _listAppointmentsState extends State<listAppointments> {
  bool hasAppointments = true;
  int _selectedIndex = 1;
  String name = 'Self';
  String service = 'Telehealth Video Visits';
  String docName = 'Craig A. Mohney';
  String docDesignation = 'MD, FAAD, FASMS';
  String date = '18 - Aug- 2020';
  String time = '3:00 PM';
  String appointmentId = '9285473';
  void _onItemTapped(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECEFF3),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Padding(padding: EdgeInsets.only(left:15,top: 40),
                child: Container(
                  height: 44,
                  child: Text('My Appointments',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Color(0xff112027)
                    ),
                  ),
                ),
              ),
              const Divider(height: 20, thickness: 10, indent: 8, endIndent: 8, color: Color(0xffE5E7E9),),
                ListView.separated(
                  itemCount: 1,
                  separatorBuilder: (BuildContext context, int index)
                  { return Divider(height: 20, thickness: 10, indent: 8, endIndent: 8, color: Color(0xffE5E7E9));},
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 20),
                        child: Column(
                          children: [
                            Row(children: [Text('$name'+'  -  '+'$service',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Color(0xff25414A)
                              ),),
                              SizedBox(width: 90),
                              IconButton(icon: Icon(Icons.more_horiz_outlined),
                                  onPressed: () {
                                    appointmentBottomSheet(context);
                                  })
                            ],),
                            Row(children: [Text('$docName, '+'$docDesignation',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xff25414A)
                              ),),],),
                            SizedBox(height: 10,),
                            Row(children: [Text('$date    '+'$time',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xff25414A).withOpacity(0.5),
                              ),),
                              SizedBox(width: 120),
                              Text('ID -  '+'$appointmentId',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: Color(0xff25414A),
                                ),),
                            ],),
                            SizedBox(height: 25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 155,
                                  height: 50,
                                  child: ElevatedButton(
                                    child: Text('CALL',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                        color: Color(0xff749BAD),
                                      ),),
                                    style: ElevatedButton.styleFrom(
                                        side: BorderSide(width: 2.0, color: Color(0xff749BAD),),
                                        primary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(30.0),)),
                                    onPressed: () {  },
                                  ),
                                ),
                                SizedBox(
                                  width: 155,
                                  height: 50,
                                  child: ElevatedButton(
                                    child: Text('CHECK IN',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Color(0xffFFFFFF),
                                    ),),
                                    style: ElevatedButton.styleFrom(
                                        //side: BorderSide(width: 2.0, color: Color(0xff749BAD),),
                                        primary: Color(0xff749BAD),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(30.0),)),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (_) => checkInMain()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                    );
                  }
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
