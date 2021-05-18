import 'dart:convert';
import 'package:app_skin_mate/ProfileSetupScreens/Gender.dart';
import 'package:app_skin_mate/Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;


class user_EditProfile extends StatefulWidget {
  @override
  _user_EditProfileState createState() => _user_EditProfileState();
}

class _user_EditProfileState extends State<user_EditProfile> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<Gender> genders = new List<Gender>();
  Position _currentPosition;
  String _currentAddress;
  String Phonenum;
  String emailll;
  String pasword;
  bool Genderselected= false;
  var gender;
  var flutter;
  var code;
  TextEditingController _location = TextEditingController();
  TextEditingController _insurance = TextEditingController();
  TextEditingController _emergencyName = TextEditingController();
  TextEditingController _emergencyNum = TextEditingController();
  @override
  void initState() {
    super.initState();
    genders.add(new Gender("1","Male",'assets/Profile_Images/male.png' , false));
    genders.add(new Gender("2","Female",'assets/Profile_Images/female.png' , false));
    genders.add(new Gender("3","Others",'assets/Profile_Images/other.png' , false));
    _location.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _insurance.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _emergencyName.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _emergencyNum.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }
  String validateMobile(String value) {
    String patttern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please Enter Phone Number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please Enter a Valid Phone Number';
    }
    return null;
  }
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
        title: Text("Setup Profile",
          style: TextStyle(
            color: Color(0xff112027),
            fontSize: 17,
          ),),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text('First Name',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: 335.0,
                height: 44.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffCCD0D5),
                    ),
                  borderRadius: BorderRadius.circular(10.0)
                  ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,top:15.0),
                    child: Text("First Name",
                      style: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),)
                   ),
                ),
              SizedBox(height: 30.0),
              Text('Last Name',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: 335.0,
                height: 44.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffCCD0D5),
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,top:15.0),
                    child: Text("Last Name",
                      style: TextStyle(
                        color: Color(0xff02122C),
                        fontSize: 12.0,
                      ),)
                ),
              ),
              SizedBox(height: 30.0),
              Text('Gender',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 110.0,
                width: 335.0,
                child: ListView. separated(
                    separatorBuilder: (BuildContext context, int index)
                    { return SizedBox(width: 10.0,); },
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: genders.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: CustomRadio(genders[index]),
                      );
                    }),
              ),
              SizedBox(height: 30.0),
              Text('Date of Birth',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 335.0,
                height: 44.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffCCD0D5),),
                borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                    children: [
                      Padding(
                      padding: const EdgeInsets.only(left: 10.0,top:10.0),
                      child: Text("DOB",
                        style: TextStyle(
                          color: Color(0xff02122C),
                          fontSize: 12.0,),
                       ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 250.0,),
                        child: Icon(Icons.calendar_today_outlined),
                        ),
                    ],
                ),
                ),
              SizedBox(height: 30.0),
              Text('Blood Group',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 335.0,
                height: 44.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffCCD0D5),
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,top:15.0),
                    child: Text("Blood Group",
                      style: TextStyle(
                        color: Color(0xff02122C),
                        fontSize: 12.0,
                      ),)
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                children: [
                  Text('Mailing Address',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff02122C)
                    ),),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: Container(
                      child:IconButton(
                          icon: Icon(Icons.my_location_sharp),
                          onPressed: () {
                            _getCurrentLocation();
                            setState(() {
                              if (_currentAddress != null) {
                                _location.text= (_currentAddress);
                              }
                            });
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      child: GestureDetector(
                          onTap: () {},
                          child: Text("Use Current Location",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 12.0,
                                color: Color(0xff699CAF)),)),
                    ),
                  ),
                ],
              ),
              Container(
                width: 335.0,
                height: 44.0,
                child: TextFormField(
                  controller: _location,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCCD0D5)),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    hintText: 'Enter Mailing Address',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text('Insurance Information',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: 335.0,
                height: 44.0,
                child: TextFormField(
                  controller: _insurance,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCCD0D5)),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    hintText: 'Enter Insurance Information',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text('Emergency Contact Name',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: 335.0,
                height: 44.0,
                child: TextFormField(
                  controller: _emergencyName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCCD0D5)),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    hintText: 'Enter Emergency Contact Name',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text('Emergency Number',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: 335.0,
                //height: 44.0,
                child: TextFormField(
                  controller: _emergencyNum,
                  validator: validateMobile,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCCD0D5)),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    hintText: 'Enter Emergency Number',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              ButtonTheme(
                child: Container(
                  width: 335.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_location.text.isEmpty || _insurance.text.isEmpty||
                          _emergencyName.text.isEmpty|| _emergencyNum.text.isEmpty)
                      {
                        final snackBar = SnackBar(
                          content: Text("Please Fill all the Details"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else if(formkey.currentState.validate()) {
                        registerUser();
                      };
                    },
                    child: Text('SAVE CHANGES',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Color(0xffFFFFFF),
                      ),),
                    style: ElevatedButton.styleFrom(
                        primary:(_location.text.isEmpty || _insurance.text.isEmpty||
                            _emergencyName.text.isEmpty|| _emergencyNum.text.isEmpty)
                            ? Colors.blueGrey[100]
                            : Color(0xff749BAD),
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),)),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
  void _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }
  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
  Future registerUser() async {
    var APIURL = Uri.parse("http://65.0.55.180/skinmate/v1.0/customer/registration");
    flutter= "Flutter";
    Map mapeddata = {
      'phoneNumber': Phonenum,
      'email': emailll,
      'gender': gender,
      'loginType': flutter,
      'password': pasword,
      'address': _location.text,
      'emeregencyNumber': _emergencyNum.text,
      'insuranceInformation': _insurance.text,
      'emeregencyContactName': _emergencyName.text
    };
    print("JSON DATA: ${mapeddata}");
    http.Response response = await http.post(APIURL, body: jsonEncode(mapeddata));
    var data = jsonDecode(response.body);
    print("DATA: ${data}");
    var code = (data[0]['Code']);
    if (code == 200)
      Navigator.push(context, MaterialPageRoute(builder: (_) => WelcomeScreen()));
  }
}




