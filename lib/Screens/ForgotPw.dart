import 'package:app_skin_mate/models/EmailOtpScreens/EmailOtpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class forgotPassword extends StatefulWidget {
  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  var code;
  var email;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _idController = TextEditingController();
  void initState() {
    super.initState();
    _idController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: new IconButton(
          icon: ImageIcon(AssetImage('assets/images/back_button.png'), color: Color(0xff02122C), size: 35,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: Text("Forgot Password",
            style: TextStyle(
              fontFamily: 'Poppins-SemiBold',
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: Color(0xff112027),
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 70.0, 10.0, 0.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formkey,
            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 60.0),
                  Text(
                    'Phone Number / Email ID',
                    style: TextStyle( color: Color(0xff02122C),
                        fontFamily: 'Poppins-Medium',
                        fontSize: 18.0),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                      controller: _idController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Number or Email ID',),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        EmailValidator(errorText: "Enter valid email id"),
                      ]),
                      onChanged: (val) {
                        // setState(() => email = val);
                      }),
                  SizedBox(height: 50.0),
                  SizedBox(
                    width: double.infinity,
                    height: 60.0,
                    child: ElevatedButton(
                        child: Text('CONTINUE',),
                        style: ElevatedButton.styleFrom(
                          primary: (_idController.text.isEmpty) ? Color(0xffCCD0D5) : Color(0xff749BAD),
                          textStyle: TextStyle(
                            fontFamily: 'Poppins-Bold',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.blueGrey[100]),
                          ),
                        ),
                        onPressed: () async {
                          if (formkey.currentState.validate()) {
                            EmailOtpApi();
                            SaveEmail();
                            getEmail();
                          }
                        }),
                  ),
                ],
            ),
          ),
        ),

      ),
    );
  }

  Future EmailOtpApi() async {
    var APIURL = Uri.parse("http://65.0.55.180/skinmate/v1.0/customer/registration-send-otp-to-email");
    Map mapeddata = {
      'email': _idController.text,};
    print("JSON DATA: ${mapeddata}");
    http.Response response = await http.post(APIURL, body: mapeddata);
    var data = jsonDecode(response.body);
    print("DATA:${data}");
    var code = (data[0]['Code']);
    print(code);
    if (code == 200) {
      OtpEmailScreen(context);
    }
    else{
      final snackBar = SnackBar(content: Text('Invalid Email'),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '';
  }
  SaveEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = _idController.text;
    prefs.setString('email', email);
  }
}
