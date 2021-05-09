import 'package:app_skin_mate/Screens/SignIn.dart';
import 'package:flutter/material.dart';

class PwSuccess extends StatefulWidget {
  @override
  _PwSuccessState createState() => _PwSuccessState();
}

class _PwSuccessState extends State<PwSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.only(top: 152.0),
                child: Center(
                  child: Container(
                      width: 170.0,
                      height: 170.0,
                      child: Image.asset('assets/images/pw_success.png')
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 63.0),
                child: Center(
                  child: Container(
                      width: 226.0,
                      height: 20,
                      child: Text("Success!",
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
              Padding(padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Container(
                    width: 275.0,
                    height: 60.0,
                    child: Text("Password has been successfully changed. \n Please login! ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins-SemiBold',
                          fontSize: 14.0,
                          color: Color(0xff112027)
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 30.0),
                child: ButtonTheme(
                  buttonColor: Color(0xff749BAD),
                  child: Container(
                    width: 335.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text('CONTINUE TO LOGIN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      textColor: Color(0xffFFFFFF),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

