import 'package:app_skin_mate/Screens/homePage.dart';
import 'package:flutter/material.dart';

class appoitmentComplete extends StatefulWidget {
  @override
  _appoitmentCompleteState createState() => _appoitmentCompleteState();
}

class _appoitmentCompleteState extends State<appoitmentComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          height: 20.0,
          width: 20.0,
          child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Image.asset('assets/Profile_Images/arrow_back.png')),
        ),
        title: Text("Schedule Confirmation",
          style: TextStyle(
            color: Color(0xff112027),
            fontSize: 17,
          ),),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:100,right:100,top: 100.0),
                child: Center(
                  child: Container(
                      width: 170.0,
                      height: 170.0,
                      child: Image.asset('assets/images/success.png')
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:75,right:75,top: 45.0),
                child: Center(
                  child: Container(
                      width: 223.0,
                      height: 21.0,
                      child: Text("Appointment Scheduled",
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
                padding: const EdgeInsets.only(top: 85.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 102.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE5E7E9)),
                    color: Colors.white,
                   ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:19,top:30),
                              child: Container(
                                  width: 53.0,
                                  height: 20.0,
                                  child: Text("Medical",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Color(0XFF25414A),
                                    ),)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:180.0,top:30.0),
                              child: Container(
                                width: 90.0,
                                height: 20.0,
                                child: Center(
                                    child: Text("ID -  9285473",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0XFF25414A),
                                      ),)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:19.0,top:8.0),
                          child: Container(
                              width: 254.0,
                              height: 21.0,
                              child: Text("Craig A. Mohney, MD FAAD, FASMS",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff25414A),
                                ),)),
                        ),
                      ],
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 86.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE5E7E9)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:19,top:30),
                            child: Container(
                                width: 127.0,
                                height: 34.0,
                                child: Text("16 - Jun - 2020\n"
                                            "3:00 PM",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF25414A),
                                  ),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:90.0),
                            child: Container(
                              width: 98.0,
                              height: 20.0,
                              child: Center(
                                  child: Text("In 1 Day 2 hours",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF25414A),
                                    ),)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 60.0,right:20.0),
                child: ButtonTheme(
                  child: Container(
                    width: 335.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => homePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff749BAD),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),)),
                      child: Text('DONE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xffFFFFFF),
                        ),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0)
            ],
          ),
        ),
    );
  }
}
