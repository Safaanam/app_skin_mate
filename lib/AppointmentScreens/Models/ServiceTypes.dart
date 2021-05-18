import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = FlutterSecureStorage();

Future<List<subServices>> getSubService(int index) async {
  List<subServices> subList;
  await storage.write(key: "service_id", value: index.toString());
  String APIURL =
      'http://65.0.55.180/secured/skinmate/v1.0/subtype-of-service/list/' +
          index.toString();
  var url = Uri.parse(APIURL);
  print('url : $APIURL');
  String token = await storage.read(key: "token");
  print(token);
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

  if (code == 200) {
    print(subserviceList);
    subList = subserviceList.entries
        .map<subServices>((entry) => subServices(entry.value))
        .toList();
    return subList;
  } else
    print('error in fetching subservices');
}

class subServices {
  String subserviceType;

  subServices(this.subserviceType);
}