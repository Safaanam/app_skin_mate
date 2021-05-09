import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
var email;

getEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email') ?? '';
}

class EmailVerificationPlaceHolder extends StatefulWidget {
  @override
  _EmailVerificationPlaceHolderState createState() => _EmailVerificationPlaceHolderState();
}

class _EmailVerificationPlaceHolderState extends State<EmailVerificationPlaceHolder> {

  void initState() {
    super.initState();
    getEmail();
  }
  @override
  Widget build(BuildContext context) {
    var email;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: new IconButton(icon: ImageIcon(AssetImage('assets/images/back_button.png'),
          color: Color(0xff02122C), size: 35,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: Text("Email Verification",
            style: TextStyle(fontFamily: 'Poppins-SemiBold',
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: Color(0xff112027),
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        width: 375.0,
        height: 812.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 152.0),
              child: Center(
                child: Container(
                    width: 170.0,
                    height: 170.0,
                    child: Image.asset('assets/images/email_ver.png')
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 63.0),
              child: Center(
                child: Container(
                    width: 226.0,
                    height: 20,
                    child: Text("Verification Required",
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
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                    width: 275.0,
                    height: 60.0,
                    child: Text("Before you schedule any appointment, you \n must verify your mail id to proceed",
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
            Padding(padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Container(
                  width: 275.0,
                  height: 60.0,
                  child: Text("We have sent a verification mail sent to \n $email",
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
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: ButtonTheme(
                buttonColor: Color(0xff749BAD),
                child: Container(
                  width: 335.0,
                  height: 50.0,
                  child: RaisedButton(
                    child: Text('RESEND MAIL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    textColor: Color(0xffFFFFFF),
                    onPressed: () {},
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
