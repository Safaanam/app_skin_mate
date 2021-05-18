import 'dart:convert';
import 'package:app_skin_mate/AppointmentScreens/family_Setup_Profile/delete_FamilyMember.dart';
import 'package:app_skin_mate/AppointmentScreens/family_Setup_Profile/family_ProfileSetup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future getFamilyInfo() async {
  int index;
  final storage = FlutterSecureStorage();
  var cust_Id = await storage.read(key: "cust_id");
  String APIURL = 'http://65.0.55.180/secured/skinmate/v1.0/customer/family-member/list/'+cust_Id.toString();
  var url = Uri.parse(APIURL);
  print('url : $APIURL');
  String token = await storage.read(key: "token");
  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );
  var ConvertedData = jsonDecode(response.body);
  var code = (ConvertedData[0]['Code']);
  print(code);
  var familyList = (ConvertedData[0]["responseInformation"]);
  print(familyList);
  if(code == 200 ) {
    for(index=0;index<familyList.length;index++) {
      var fName = familyList[index]['firstName'];
      var lName = familyList[index]['lastName'];
      var data= fName + " " + lName;
      return data;
    }
  }
  else print('error in fetching familyLists');
}


class familyMembers {

  int familyProfileId;
  String firstName;

  familyMembers({this.familyProfileId, this.firstName});

  factory familyMembers.fromJson(Map<String, dynamic> json) {
    return familyMembers(
      familyProfileId: json['familyProfileId'],
      firstName: json['firstName'],
    );
  }

}
Widget bottomscreen(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50.0),
        topLeft: Radius.circular(50.0),),
    ),
    builder: (context) => Container(
        height: 100.0,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0XFFE5E7E9),
                    width: 2.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: FlatButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => family_SetProfile()))
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      SizedBox(width: 5.0),
                      Text("Edit Family Member",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Color(0XFF749BAD),
                        ),)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Container(
                child: FlatButton(
                  onPressed: () => {
                    deleteAlert(context)
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete),
                      SizedBox(width: 5.0),
                      Text("Delete Member",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Color(0XFFA2071E),
                        ),)
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    ),
  );
}