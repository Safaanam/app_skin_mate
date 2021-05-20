import 'package:app_skin_mate/Screens/homePage.dart';
import 'package:flutter/material.dart';

Widget apointmentCancelledAlert(BuildContext context) {
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
            height: 248.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 46.0),
                  child: Center(
                    child: Container(
                        width: 40.0,
                        height: 32.0,
                        child: Image.asset('assets/user_Profile/ticked.png')
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 37.0),
                  child: Center(
                    child: Container(
                        width: 226.0,
                        height: 80,
                        child: Text("The Appointments has been\n"
                                    "cancelled",
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
                InkWell(
                    child: Container(
                      width: 276.0,
                      height: 53.0,
                      decoration: BoxDecoration(
                        color: Color(0XFF749BAD),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => homePage()));
                        },
                        child: Center(
                          child: Text("OKAY",
                            style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.bold,),
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
}