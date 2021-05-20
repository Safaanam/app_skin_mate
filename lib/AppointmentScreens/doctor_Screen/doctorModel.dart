import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = FlutterSecureStorage();

class doctors {
  int doctorId;
  String firstName;
  String lastName;
  String designation;

  doctors({this.doctorId, this.firstName, this.lastName, this.designation});

  factory doctors.fromJson(Map<String, dynamic> json) {
    return doctors(
      doctorId: json['doctorId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      designation: json['designation'],
    );
  }
}

Future<List<doctors>> getDoctor() async{
  List<doctors> doclist;
  String service_id = await storage.read(key: "service_id");
  String token = await storage.read(key: "token");
  var APIURL = Uri.parse("http://65.0.55.180/secured/skinmate/v1.0/doctors/list");
  Map mapeddata = {
    'serviceId': service_id,
  };
  http.Response response = await http.post(APIURL, headers: {'Authorization': 'Bearer $token'}, body: mapeddata);
  var data = jsonDecode(response.body);
  var rest = data[0]["responseInformation"] as List;
  var code = (data[0]['Code']);
  if(code == 200) {
    doclist = rest.map<doctors>((json) => doctors.fromJson(json)).toList();
    return doclist;
  }
}