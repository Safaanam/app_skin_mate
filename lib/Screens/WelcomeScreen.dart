import 'package:app_skin_mate/Screens/SignIn.dart';
import 'package:app_skin_mate/Screens/signupscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Text("Welcome to",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Color(0xff2A3E49)
                      ),)),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Container(
                      width: 130.0,
                      height: 40,
                      child: Text("SkinMate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Center(
                    child: Container(
                        width: 70,
                        height: 90,
                        child: Image.asset('assets/images/logo1.jpg')),
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Image.asset('assets/images/logo2.png')),
              ),
            ),
            Padding(
              //padding: EdgeInsets.symmetric(vertical: 110.0),
              padding: const EdgeInsets.only(top:90.0),
              child: Container(
                constraints: BoxConstraints.expand(
                    width: MediaQuery.of(context).size.width,
                    height: 300.0
                ),
                decoration: BoxDecoration(
                  color: Color(0xff2B404A),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 15.0,top:50.0,bottom: 0),
                      //padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ButtonTheme(
                        height: 60.0,
                        child: Container(
                          width: 335.0,
                          height: 60.0,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(28.0),
                                  side: BorderSide(color: Color(0xFF749BAD)),
                                ),),
                              backgroundColor: MaterialStateProperty.all(Color(0XFF2B404A)),),
                            child: Text('SIGN UP',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Color(0xffFFFFFF),
                              ),),
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => SignupScreen()));
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 13.0, bottom: 0),
                      //padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ButtonTheme(
                        height: 60.0,
                        buttonColor: Color(0xff749BAD),
                        child: Container(
                          width: 335.0,
                          height: 60.0,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(28.0),
                                  side: BorderSide(color: Color(0xff749BAD)),
                                ),),
                              backgroundColor: MaterialStateProperty.all(Color(0XFF749BAD)),),
                            child: Text('SIGN IN',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Color(0xffFFFFFF),
                              ),),
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => SignInPage()));
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ), //navigate to sigin pag
                    Text('Privacy Policy . Terms and Conditions',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.0,
                          color: Color(0xff749BAD)
                      ),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}