import 'package:app_skin_mate/AppointmentScreens/calender/dateTimeSelection.dart';
import 'package:app_skin_mate/AppointmentScreens/cancelAppointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget appointmentBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50.0),
        topLeft: Radius.circular(50.0),),
    ),
    builder: (context) => Container(
        height: 100.0,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0XFFE5E7E9),
                    width: 2.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: FlatButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => dateTimeSelect()))
                  },
                    child: Center(
                      child: Text("Reschedule Appointment",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color(0XFF749BAD),
                          ),
                      ),
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                child: FlatButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => cancelAppo()))
                    //deleteAlert(context)
                  },
                    child:Center(
                      child: Text("Cancel Appointment",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color(0XFFA2071E),
                          ),),
                    )
                ),
              ),
            ),
          ],
        )
    ),
  );
  throw('error in appointment_bottom');
}