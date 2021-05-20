import 'package:app_skin_mate/models/EmailOtpScreens/EmailErrorScreen.dart';
import 'package:app_skin_mate/models/EmailOtpScreens/EmailSuccessScreen.dart';
import 'package:app_skin_mate/models/OtpScreens/OtpErrorScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


var emaill;
TextEditingController _otp = TextEditingController();

@override
void initState() {
  getEmail();
}
getEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  emaill = prefs.getString('email') ?? '';
  print(emaill);
}

Widget OtpEmailScreen(BuildContext context) {

  var code;
  showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40.0),
        topLeft: Radius.circular(40.0),),
    ),
    builder: (context) =>
        SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            constraints: BoxConstraints.expand(
                width: 375.0,
                height: 419.0
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 36.5),
                    child: Center(
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 60,
                        child: Text("Enter OTP",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color(0xff02122C)
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.5),
                    child: Center(
                      child: Container(
                          width: 60,
                          height: 60,
                          child: Image.asset('assets/images/phone.png')
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 29.0),
                    child: Center(
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 60,
                        child: Text("Please enter OTP sent ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xff02122C
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 40.0),
                        Container(
                          height: 46.0,
                          width: 333.0,
                          child: TextFormField(
                            controller: _otp,
                            //keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 32.0),
                        child: buildTimer(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 190.0, right: 10.0, top: 32.0, bottom: 0),
                        child: Container(
                            child: Text("Resend OTP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffCCD0D5),
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ButtonTheme(
                      child: Container(
                        width: 335.0,
                        height: 50.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: (_otp.text.isEmpty)
                                ? Colors.blueGrey[100]
                                : Color(0xff749BAD),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),),
                          child: Text('CONFIRM',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            OtpChecker(context);
                            getEmail();
                            },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ),
  );
}
Row buildTimer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TweenAnimationBuilder(
        tween: Tween(begin: 60.0, end: 0.0),
        duration: Duration(seconds: 60),
        builder: (_, value, child) =>
            Text(
              "0m ${value.toInt()}s",
            ),
      ),
    ],
  );
}
Future OtpChecker(BuildContext context) async {
  var APIURL = Uri.parse(
      "http://65.0.55.180/skinmate/v1.0/customer/email-otp-verify");
  Map mapeddata = {
    'email': emaill,
    'otp': _otp.text,
  };
  http.Response response = await http.post(APIURL, body: mapeddata);
  var data = jsonDecode(response.body);
  print("DATA: ${data}");
  var code = (data[0]['Code']);
  print(code);
  if (code == 200)
    return EmailSuccessAlert(context);
  else
    return openEmailErrorAlert(context);
}


