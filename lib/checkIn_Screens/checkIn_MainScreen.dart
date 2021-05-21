import 'package:app_skin_mate/checkIn_Screens/check_In.dart';
import 'package:flutter/material.dart';

class checkInMain extends StatefulWidget {
  @override
  _checkInMainState createState() => _checkInMainState();
}

class _checkInMainState extends State<checkInMain> {
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
        title: Text("Check In",
          style: TextStyle(
              color: Color(0xff112027),
              fontSize: 17,
              fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:20.0,top: 30.0,right: 20.0),
                child: Container(
                  height: 99.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color:  Color(0xFFE5E7E9)),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)
                    ),
                  ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:23.0,bottom:29.0),
                          child: Container(
                              width:40.0,
                              height: 40.0,
                              child: Image.asset('assets/checkIn_Images/location.png')
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right:80.0,top:16.5),
                              child: Container(
                                width: 139.0,
                                height: 21.0,
                                child: Text("You have reached",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff112027),
                                ),)),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(left:10.0,top:12.0),
                              child: Container(
                                  width: 225.0,
                                  height:34.0,
                                  child: Text("SOUTHWEST MICHIGAN DERMATOLOGY\n"
                                    "PORTAGE, MI",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff97A1A6),
                                    ),)),
                            ),
                            ],
                        ),
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Container(
                    constraints: BoxConstraints.expand(
                        width: MediaQuery.of(context).size.width,
                        height: 82.0
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff2B4049),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0),),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:21.0,top:9.0),
                          child: Container(
                              width:22.0,
                              height: 22.0,
                              child: Image.asset('assets/checkIn_Images/info.png')
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0,top:20.0),
                          child: Container(
                              width: 275.0,
                              height: 38.0,
                              child: Text("Please wait for your turn to walk-up to the\n"
                                "waiting-room!",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.white,
                                ),)),
                        ),
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0,top: 20.0,right: 20.0),
                child: Container(
                  height: 307.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color:  Color(0xFFE5E7E9)),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0)
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:20.5,top:27.5),
                            child: Container(
                                width: 157.0,
                                height: 19.0,
                                child: Text("Appointment Summary",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff112027),
                                  ),)),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(left:70.0,top:27.5),
                            child: Container(
                                width: 60.0,
                                height: 21.0,
                                decoration: BoxDecoration(
                                  border: Border.all(color:  Color(0xFFE5E7E9))),
                                child: Center(
                                child: Text("Self",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff8E989D),
                                  ),)),
                                ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:20.5,top:10.0),
                                child: MyBullet(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:10.0,top:15.0),
                                child: Container(
                                    width: 130.0,
                                    height: 19.0,
                                    child: Text("IPL Laser Treatment ",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff8E989D),
                                      ),)),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:20.5),
                                child: MyBullet(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:10.0,top:4.0),
                                child: Container(
                                    width: 80.0,
                                    height: 19.0,
                                    child: Text("ID - 9285473",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff8E989D),
                                      ),)),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:20.5),
                                      child: Container(
                                          width: 45.0,
                                          height: 15.0,
                                          child: Text("Doctor",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff112027),
                                          ),)),
                                     ),
                                  Padding(
                                    padding: EdgeInsets.only(left:MediaQuery.of(context).size.width / 2.2),
                                    child: Container(
                                      width: 68.0,
                                      height: 60.0,
                                      child: Center(
                                        child: Image.asset('assets/checkIn_Images/doc.png')),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2.2, left:10),
                                  child: Container(
                                    width: 129.0,
                                    height: 32.0,
                                    child: Text("Dr. Andrew Williams\n"
                                                "MD FAAD, FASMS",
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff8E989D),
                                    ),)),
                                 ),
                              ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left:20.5,top:20.0),
                                child: Container(
                                    width: 79.0,
                                    height: 19.0,
                                    child: Text("Date & Time",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff112027),
                                      ),)
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:20.5,top:10.0),
                                        child: MyBullet(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0,top:15.0),
                                        child: Container(
                                            width: 92.0,
                                            height: 19.0,
                                            child: Text("15 - Jun - 2020",
                                              style: TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff8E989D),
                                              ),)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:20.5),
                                        child: MyBullet(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:10.0,top:4.0),
                                        child: Container(
                                            width: 60.0,
                                            height: 19.0,
                                            child: Text("3:00 PM",
                                              style: TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff8E989D),
                                              ),)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top:55.0),
                child: Container(
                    width: 247.0,
                    height: 17.0,
                    child: Text("In the interim you can complete Checkin",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff25414A),
                      ),)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 26.0,right:20.0),
                child: ButtonTheme(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => checkIn()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff749BAD),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),)),
                      child: Text('CHECK IN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xffFFFFFF),
                        ),),
                    ),
                  ),
                ),
              ),
              SizedBox(height:20.0),
            ],
          ),
        ),
    );
  }
}
class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Color(0xff25414A),
        shape: BoxShape.circle,
      ),
    );
  }
}
