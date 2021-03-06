import 'package:app_skin_mate/models/OtpScreens/OtpErrorScreen.dart';
import 'package:app_skin_mate/models/OtpScreens/OtpSuccessScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

final storage = FlutterSecureStorage();
TextEditingController _otp = TextEditingController();


Widget OtpScreen(BuildContext context) {
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
                width: MediaQuery.of(context).size.width,
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
                        width: MediaQuery.of(context).size.width,
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
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Text("Please enter OTP sent\n"
                            "to your phone Number",
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
                        padding:  EdgeInsets.only(top: 10, left: MediaQuery.of(context).size.width / 15),
                        child: buildTimer(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:MediaQuery.of(context).size.width /1.8,top:10),
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
  throw('error in OtpMainScreen');
}
Row buildTimer() {
  return Row(
    //mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TweenAnimationBuilder(
        tween: Tween(begin: 60.0, end: 0.0),
        duration: Duration(seconds: 60),
        builder: (_, dynamic value, child) =>
            Text(
              "0m ${value.toInt()}s",
            ),
      ),
    ],
  );
}
Future OtpChecker(BuildContext context) async {
  String? PhoneNum = await storage.read(key: "PhoneNum");
  var APIURL = Uri.parse(
      "http://65.0.55.180/skinmate/v1.0/customer/mobile-otp-verify");
  Map mapeddata = {
    'otp': _otp.text,
    'mobileNumber': PhoneNum,
  };
  http.Response response = await http.post(APIURL, body: mapeddata);
  var data = jsonDecode(response.body);
  var code = (data[0]['Code']);
  if (code == 200)
    return SuccessAlert(context);
  else
    return openErrorAlert(context);
}


