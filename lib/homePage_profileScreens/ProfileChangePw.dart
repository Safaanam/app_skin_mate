import 'dart:convert';
import 'package:app_skin_mate/homePage_profileScreens/userProfile.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;

class profileChangePw extends StatefulWidget {
  @override
  _profileChangePwState createState() => _profileChangePwState();
}

class _profileChangePwState extends State<profileChangePw> {
  final storage = FlutterSecureStorage();
  TextEditingController _pwController1 = TextEditingController();
  TextEditingController _pwController2 = TextEditingController();
  TextEditingController _pwController3 = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var code;
  var cust_id = 1;
  bool _passwordVisible = true;
  String password = '';

  void initState() {
    _passwordVisible = true;
    super.initState();
    _pwController1.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _pwController2.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _pwController3.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    MaxLengthValidator(15, errorText: "Password should not be greater than 15 characters"),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: new IconButton(icon: ImageIcon(AssetImage('assets/images/back_button.png'),
          color: Color(0xff02122C), size: 35,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: Text("Change Password",
            style: TextStyle(fontFamily: 'Poppins-SemiBold',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 60.0),
                        Text('Current Password',
                          style: TextStyle(
                              color: Color(0xff02122C),
                              fontFamily: 'Poppins-Medium',
                              fontSize: 12.0),
                        ),
                        SizedBox(height: 5.0),
                        TextFormField(
                          controller: _pwController1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Current Password',
                            hintStyle: TextStyle(
                              color: Color(0xff02122C),
                              fontSize: 12.0,
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(_passwordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,),
                                onPressed: () {
                                  setState(() {_passwordVisible ^= true;});
                                }),
                          ),
                          //validator: passwordValidator,
                          obscureText: _passwordVisible,
                          //onChanged: (val) => password = val,
                        ),
                        SizedBox(height: 15.0),
                        Text('New Password',
                          style: TextStyle(
                              color: Color(0xff02122C),
                              fontFamily: 'Poppins-Medium',
                              fontSize: 12.0),
                        ),
                        SizedBox(height: 5.0),
                        TextFormField(
                          controller: _pwController2,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter New Password',
                            hintStyle: TextStyle(
                              color: Color(0xff02122C),
                              fontSize: 12.0,
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(_passwordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,),
                                onPressed: () {
                                  setState(() {_passwordVisible ^= true;});
                                }),
                          ),
                          validator: passwordValidator ,
                          obscureText: _passwordVisible,
                          onChanged: (val) => password = val,
                        ),
                        SizedBox(height: 15.0),
                        Text('New Password',
                          style: TextStyle(
                              color: Color(0xff02122C),
                              fontFamily: 'Poppins-Medium',
                              fontSize: 12.0),
                        ),
                        SizedBox(height: 5.0),
                        TextFormField(
                            controller: _pwController3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Password',
                              hintStyle: TextStyle(
                                color: Color(0xff02122C),
                                fontSize: 12.0,
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(_passwordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,),
                                  onPressed: () {
                                    setState(() {_passwordVisible ^= true;});
                                  }),
                            ),
                            validator: (val) => MatchValidator(errorText: 'passwords do not match').validateMatch(val!, password),
                            obscureText: _passwordVisible,
                            onChanged: (val) {// setState(() => password = val);
                            }
                        ),
                        SizedBox(height: 50.0),
                        SizedBox(
                          width: double.infinity,
                          height: 60.0,
                          child: ElevatedButton(
                              child: Text('CHANGE PASSWORD',),
                              style: ElevatedButton.styleFrom(
                                primary: (_pwController1.text.isEmpty || _pwController2.text.isEmpty
                                  || _pwController3.text.isEmpty) ? Color(0xffCCD0D5) : Color(0xff749BAD),
                                textStyle: TextStyle(
                                  fontFamily: 'Poppins-Bold',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                  side: BorderSide(color: Colors.blueGrey[100]!),
                                ),
                              ),
                              onPressed: () async {
                                if (_pwController1.text.isEmpty || _pwController2.text.isEmpty || _pwController3.text.isEmpty)
                                 {
                                   final snackBar1 = SnackBar(
                                     content: Text('Unable to update password, please fill all fields'),
                                   );
                                   ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                                 }
                                else if(_pwController1.text == _pwController2.text){
                                  final snackBar1 = SnackBar(
                                    content: Text('Old password cannot be set as new password'),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                                }
                                else {
                                  profilePwChangeAPI();
                                  //Navigator.push(context, MaterialPageRoute(builder: (_) => PwSuccess()));
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

  Future profilePwChangeAPI() async {
    String? cust_id = await storage.read(key: "cust_id");
    String? token = await storage.read(key: "token");
    var APIURL=Uri.parse("http://65.0.55.180/secured/skinmate/v1.0/customer/change-password");
    Map mapeddata ={
      'customerId': cust_id,
      'oldPassword' : _pwController1.text,
      'newPassword' : _pwController3.text,
    };
    print("JSON DATA: ${mapeddata}");
    http.Response response= await http.post(APIURL,
        headers: {'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },body:jsonEncode(mapeddata));
    var data =jsonDecode(response.body);
    print("DATA:${data}");
    var code=(data[0]['Code']);
    //print(code);
    if(code==200)
    {
      Navigator.push(context, MaterialPageRoute(builder: (_) => UserProfile()));
      final snackBar2 = SnackBar(
        content: Text('updated password'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar2);

    }
    else
      {
        final snackBar3 = SnackBar(
          content: Text('Unable to update password, please try again!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar3);
      }

  }
}

