import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = FlutterSecureStorage();
class Services {
  var serviceId;
  var serviceType;

  Services({this.serviceId, this.serviceType});

   factory Services.fromJson(Map<String, dynamic> json) {
     return Services(
         serviceId: json['serviceId'],
         serviceType: json['serviceType'],
     );
   }
}


Future<List<Services>> fetchServices() async {
  String token = await storage.read(key: "token");
  List<Services> list;

  final response = await http.get(
      Uri.parse('http://65.0.55.180/secured/skinmate/v1.0/service/list'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
 var ConvertedData = jsonDecode(response.body);
 var code = (ConvertedData[0]['Code']);
 var rest = ConvertedData[0]["responseInformation"] as List;

  if (token != null) {

    if(code == 200){
      list = rest.map<Services>((json) => Services.fromJson(json)).toList();
      return list;
    }
  }
  else {
    print("error in token");
  }

}