import 'dart:convert';

import 'package:app_skin_mate/homePage_profileScreens/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = FlutterSecureStorage();


class addInsurance extends StatefulWidget {
  @override
  _addInsuranceState createState() => _addInsuranceState();
}

class _addInsuranceState extends State<addInsurance> {
  var cust_Id;
  String? token;
  TextEditingController _insurance = TextEditingController();
  @override
  void initState() {
    super.initState();
    _insurance.addListener(() {
      setState(() {});
    });
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
        title: Text("Add Insurance",
          style: TextStyle(
            color: Color(0xff112027),
            fontSize: 17,
          ),),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Text('ADD INSURANCE',
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff02122C)
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Container(
                width: 250.0,
                height: 44.0,
                child: TextFormField(
                  controller: _insurance,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCCD0D5)),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    hintText: 'Add insurance details',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
            width: 180.0,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () async {
                if(_insurance.text.isEmpty)
                {
                  final snackBar = SnackBar(
                    content: Text("Please Fill the insurace Details"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                else{
                 await  addInsuranceInfo();
                }
              },
              child: Text('SUBMIT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Color(0xffFFFFFF),
                ),),
              style: ElevatedButton.styleFrom(
                  primary:_insurance.text.isEmpty
                      ? Colors.blueGrey[100]
                      : Color(0xff749BAD),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),)),
            ),
            ),
          ),
        ],
      ),
      ),
    );
  }

  Future addInsuranceInfo() async {
    cust_Id = await storage.read(key: "cust_id");
    token = await storage.read(key: "token");
    var APIURL = Uri.parse("http://65.0.55.180/secured/skinmate/v1.0/customer/insurance/add");
    Map mapeddata = {
      'customerId' : cust_Id,
      'insuranceInformation': _insurance.text,
    };
    http.Response response = await http.post(APIURL,
        headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
        body: jsonEncode(mapeddata));
    var data = jsonDecode(response.body);
    var code = (data[0]['Code']);
    if (code == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => UserProfile()));
      final snackBar = SnackBar(
        content: Text("Insurance added succesfully"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}