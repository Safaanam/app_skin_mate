import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future getSubService(var index) async {
  int recievedNum = index.toInt();
  int list_num = recievedNum+1;
  String APIURL = 'http://65.0.55.180/secured/skinmate/v1.0/subtype-of-service/list/'+list_num.toString();
  var url = Uri.parse(APIURL);
  print('url : $APIURL');
  final storage = FlutterSecureStorage();
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
  var subserviceList = ConvertedData[0]["responseInformation"];
  if(code == 200) {
    print(subserviceList);
    List convertedList = subserviceList.values.toList();
    print('converted list : $convertedList');
    //return convertedList;
   // var list = convertedList.map<subServices>((json) => subServices().fromJson(json));
  }
  else print('error in fetching subservices');
}
class subServices {

  int subserviceId;
  String subserviceType;

  subServices({this.subserviceId, this.subserviceType});

  factory subServices.fromJson(Map<String, dynamic> json) {
    return subServices(
      subserviceId: json['subserviceId'],
      subserviceType: json['subserviceType'],
    );
  }

}
class Service {
  String ServiceType;
  String imageUrl;
  bool isSelected;

  Service(this.ServiceType, this.imageUrl, this.isSelected);
}
class selectService extends StatefulWidget {
  Service _service;
  selectService(this._service);
  @override
  _selectServiceState createState() => _selectServiceState();
}

class _selectServiceState extends State<selectService> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75.0,
      margin: EdgeInsets.all(20) ,
      decoration: BoxDecoration(
        border: Border.all(color: widget._service.isSelected ? Color(0xFF143A4C) : Color(0xFFE5E7E9)),
        color: widget._service.isSelected ? Color(0xffB2BFB8) : Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0.0),
            topLeft:  Radius.circular(15.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(15.0)
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 115.0),
              child: Container(
                width: 150.0,
                height: 70.0,
                child: Center(
                  child: Row(
                    children: [
                      Image(
                        height: 50.0,
                        width: 50.0,
                        image: AssetImage(widget._service.imageUrl),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(widget._service.ServiceType,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Color(0XFF749BAD),
                        ),
                      ),
                      ),

                    ],
                  ),
               ),
            ),
          ),
        ],
      ),
    );
  }
}

