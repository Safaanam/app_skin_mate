import 'package:app_skin_mate/AppointmentScreens/scheduleAppointment.dart';
import 'package:flutter/material.dart';


class NoAppointment extends StatefulWidget {
  @override
  _NoAppointmentState createState() => _NoAppointmentState();
}

class _NoAppointmentState extends State<NoAppointment> {
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
                  width: 335.0,
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
    );
  }
}