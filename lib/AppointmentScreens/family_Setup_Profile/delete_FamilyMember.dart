import 'dart:convert';

import 'package:app_skin_mate/homePage_profileScreens/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = FlutterSecureStorage();
var code;

Future<Widget> deleteAlert(BuildContext context) async{
  String memName = await storage.read(key: "memName");
  Navigator.pop(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0.0),
                topLeft:  Radius.circular(32.0),
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(32.0)
            ),
          ),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: 276.0,
            height: 290.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: Center(
                    child: Container(
                        width: 28.3,
                        height: 44.3,
                        child: Image.asset('assets/user_Profile/delete.png')
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: Container(
                        width: 226.0,
                        height: 40,
                        child: Text("Do you want to Delete",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff112027)
                          ),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Container(
                        width: 225.0,
                        height: 60.0,
                        child: Text("$memName",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xff02122C)
                          ),
                        )
                    ),
                  ),
                ),
                InkWell(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 139.0,
                        height: 60.7,
                        padding: EdgeInsets.only(top: 17.0,bottom: 17.0),
                        decoration: BoxDecoration(
                          color: Color(0XFF749BAD),),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text("NO",
                          style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.bold,),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ),
                      SizedBox(width: 2.0),
                      Container(
                        width: 139.0,
                        height: 60.7,
                        padding: EdgeInsets.only(top: 17.0,bottom: 17.0),
                        decoration: BoxDecoration(
                          color: Color(0XFF749BAD),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(32.0)),
                        ),
                        child: GestureDetector(
                          onTap: () async{
                           await deleteFamilyMember();
                           if(code == 200)
                             {
                               final snackBar = SnackBar(
                                 content: Text('Deleted $memName Succesfully'),
                               );
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => UserProfile()), (route) => false);
                             }
                           else
                             {
                               final snackBar1 = SnackBar(
                                 content: Text('Could not delete $memName '),
                               );
                               ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                             }
                          },
                          child: Text("YES",
                            style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.bold,),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });

}
Future deleteFamilyMember() async {
  String token = await storage.read(key: "token");
  String familyProfileId = await storage.read(key: "fam_Id");
  String APIURL= 'http://65.0.55.180/secured/skinmate/v1.0/customer/family-member/delete/'+familyProfileId.toString();
  final http.Response response = await http.delete(
    Uri.parse(APIURL),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );
  var ConvertedData = jsonDecode(response.body);
  code = (ConvertedData[0]['Code']);
}