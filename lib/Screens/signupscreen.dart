import 'dart:convert';
import 'package:app_skin_mate/ProfileSetupScreens/SetProfile.dart';
import 'package:app_skin_mate/Screens/SignIn.dart';
import 'package:app_skin_mate/models/OtpScreens/OtpMainScreen.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  String Phonenum;
  String emailll;
  String pasword;
  var code;
  int OTP = 230346;
  TextEditingController _phone = TextEditingController();
  TextEditingController _emaill = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpass = TextEditingController();

  @override
  void initState() {
    super.initState();
    getSignupValues();
    _passwordVisible = true;
    _phone.addListener(() {
      setState(() {});
    });
    _emaill.addListener(() {
      setState(() {});
    });
    _password.addListener(() {
      setState(() {});
    });
    _confirmpass.addListener(() {
      setState(() {});
    });
  }

  String validateMobile(String value) {
    String patttern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please Enter Phone Number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please Enter a valid Phone Number';
    }
    return null;
  }

  /*@override
  void dispose() {
    _phone.dispose();
    _emaill.dispose();
    _password.dispose();
    _confirmpass.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 20.0,
          width: 20.0,
          child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Image.asset('assets/Profile_Images/arrow_back.png')),
        ),
        title: Text("Sign Up",
          style: TextStyle(
            color: Color(0xff112027),
            fontSize: 17,

          ),),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
          child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text('Phone Number',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: MediaQuery.of(context).size.width,
                //height: 44.0,
                child: TextFormField(
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  validator: validateMobile,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Number',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text('Email Id',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: MediaQuery.of(context).size.width,
                //height: 44.0,
                child: TextFormField(
                    controller: _emaill,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      EmailValidator(errorText: "Enter valid email id"),
                    ]),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      border: OutlineInputBorder(),
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(
                        color: Color(0xff02122C),
                        fontSize: 12.0,
                      ),
                    ),
                    onChanged: (val) {
                      // setState(() => email = val);
                    }
                ),
              ),
              SizedBox(height: 30.0),
              Text('Set Password',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: MediaQuery.of(context).size.width,
                //height: 44.0,
                child: TextFormField(
                    obscureText: !_passwordVisible,
                    controller: _password,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(6,
                          errorText: "Password should be atleast 6 characters"),
                      MaxLengthValidator(15,
                          errorText:
                          "Password should not be greater than 15 characters")
                    ]),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      border: OutlineInputBorder(),
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                        color: Color(0xff02122C),
                        fontSize: 12.0,
                      ),
                      suffixIcon:
                      IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                              //print("Icon button pressed! state: $_passwordVisible"); //Confirmed that the _passwordVisible is toggled each time the button is pressed.
                            });
                          }),
                    ),
                    onChanged: (val) {
                      // setState(() => password = val);
                    }
                ),
              ),
              SizedBox(height: 30.0),
              Text('Confirm Password',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: MediaQuery.of(context).size.width,
                //height: 44.0,
                child: TextFormField(
                    obscureText: !_passwordVisible,
                    controller: _confirmpass,
                    validator: (value) {
                      if (value != _password.text) {
                        return 'Password is not matching';
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      border: OutlineInputBorder(),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        color: Color(0xff02122C),
                        fontSize: 12.0,
                      ),
                      suffixIcon:
                      IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible =
                              !_passwordVisible; // print("Icon button pressed! state: $_passwordVisible"); //Confirmed that the _passwordVisible is toggled each time the button is pressed.
                            });
                          }),
                    ),
                    onChanged: (val) {
                      // setState(() => password = val);
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10,top: 60.0,right:10.0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: ButtonTheme(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState.validate()) {
                          DuplicateChecker();
                          SavephoneNuM();
                          getSignupValues();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: _phone.text.isEmpty ||
                              _emaill.text.isEmpty ||
                              _password.text.isEmpty ||
                              _confirmpass.text.isEmpty
                              ? Colors.blueGrey[100]
                              : Color(0xff749BAD),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),)),
                      child: Text('PROCEED',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xffFFFFFF),
                        ),),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "The  Mobile Number will be verified with One Time Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff25414A)
                        ),)),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Existing User?",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff749BAD)),),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignInPage())); //navigate to sigin page
                    },
                    child: Text(" Sign In", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Color(0xff749BAD)
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text('Privacy Policy . Terms and Conditions',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.0,
                      color: Color(0xff749BAD)
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Future DuplicateChecker() async {
    var APIURL = Uri.parse("http://65.0.55.180/skinmate/v1.0/customer/duplicate-checker");
    Map mapeddata = {
      'phoneNumber': _phone.text,
      'email': _emaill.text,
    };
    http.Response response = await http.post(APIURL, body: mapeddata);
    var data = jsonDecode(response.body);
    var code = (data[0]['Code']);
    var respinfo= (data[0]['responseInformation']);
    if (code == 200) {
      final snackBar = SnackBar(
        content: Text('Mobile Number or Email is Already Registered'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else if(code == 205 && respinfo == 1)
    {
      return OtpScreen(context);
    }
    else if(code == 205 && respinfo == 2)
      Navigator.push(
          context, MaterialPageRoute(builder: (_) =>
          SetProfile()));
    else
      return "error";

  }
  getSignupValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      Phonenum = prefs.getString('PhoneNumber') ?? '';
      emailll = prefs.getString('email') ?? '';
      pasword = prefs.getString('password') ?? '';
  }
  SavephoneNuM() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      Phonenum = _phone.text;
      emailll = _emaill.text;
      pasword = _password.text;
    prefs.setString('PhoneNumber', Phonenum);
    prefs.setString('email', emailll);
    prefs.setString('password', pasword);
  }
}