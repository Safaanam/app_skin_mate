import 'dart:convert';
import 'package:app_skin_mate/AppointmentScreens/Models/ServiceTypes.dart';
import 'package:app_skin_mate/AppointmentScreens/doctor_Screen/doctorModel.dart';
import 'package:app_skin_mate/AppointmentScreens/doctor_Screen/select_Doctor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
final storage = FlutterSecureStorage();


class scheduleAppoitment extends StatefulWidget {
  @override
  _scheduleAppoitmentState createState() => _scheduleAppoitmentState();
}

class _scheduleAppoitmentState extends State<scheduleAppoitment> {
  List<Service> serve = new List<Service>();
  Future<List<subServices>> subserve;
  bool isSelected = false;
  @override
  void initState() {
    //subserve = getSubService(int);

    //serve.add(new Service("General Meet",'assets/user_Profile/doc.png', false));
    //serve.add(new Service("Daily Checkup",'assets/user_Profile/Daily_Checkup.png', false));
  }
  @override
  Widget build(BuildContext context) {

    var selectedId = (ModalRoute.of(context).settings.arguments as Map)["selectedId"];

    return Scaffold(
          appBar: AppBar(
            leading: Container(
              height: 20.0,
              width: 20.0,
              child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Image.asset('assets/Profile_Images/arrow_back.png')),
            ),
            title: Text("Medical",
              style: TextStyle(
                color: Color(0xff112027),
                fontSize: 17,
                fontWeight: FontWeight.bold,),),
              backgroundColor: Colors.white,
              brightness: Brightness.light,
              elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80.0,
                        child: Text("Please choose your option to schedule an\n"
                          "appointment",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Color(0xff25414A)
                          ),)),
                  ),
                ),
                SizedBox(height:20.0),
                FutureBuilder<List<subServices>>(
                  future: getSubService(selectedId),
                    builder:(context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Container(
                        child: ListView.separated(
                          itemCount: snapshot.data.length,
                          separatorBuilder: (BuildContext context, int index)
                          { return SizedBox(height: 20.0,); },
                          shrinkWrap: true,
                            itemBuilder: (context, index){
                            return InkWell(
                              onTap: (() {
                                getDoctor();
                                Navigator.push(context, MaterialPageRoute(builder: (_) => doctor_Selection()));
                              }),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 75.0,
                                margin: EdgeInsets.all(20) ,
                                decoration: BoxDecoration(
                                  border: Border.all(color: isSelected ? Color(0xFF143A4C) : Color(0xFFE5E7E9)),
                                  color: isSelected ? Color(0xffB2BFB8) : Colors.white,
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
                                                image: AssetImage('assets/user_Profile/Daily_Checkup.png'),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10.0),
                                                child: Text("${snapshot.data[index].subserviceType}",
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
                              ),
                            );
                            }
                            ),

                      );
                    }
                  }
                )
              ],
            ),
          ),
    );
  }


}
