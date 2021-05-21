import 'package:app_skin_mate/AppointmentScreens/Models/listAppointments.dart';
import 'package:app_skin_mate/Screens/homePage.dart';
import 'package:flutter/material.dart';

Widget callIn(BuildContext context) {
  Navigator.pop(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0.0),
                topLeft:  Radius.circular(32.0),
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(32.0)
            ),
          ),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: 276.0,
            height: 230.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 39.0),
                  child: Center(
                    child: Container(
                        width: 43.0,
                        height: 43.0,
                        child: Image.asset('assets/checkIn_Images/checkIn_Image2.png')
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 39.0),
                  child: Center(
                    child: Container(
                        width: 226.0,
                        height: 48,
                        child: Text("Please call us!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff112027)
                          ),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 11.0),
                  child: InkWell(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => listAppointments()));
                      },
                    child: Container(
                      width: 276.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0XFF749BAD),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.0)),
                      ),
                        child: Center(
                          child: Text("CALL",
                            style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.bold,fontSize: 15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
  throw('error in call_in screen');
}