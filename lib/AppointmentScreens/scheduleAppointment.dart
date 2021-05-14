import 'package:app_skin_mate/AppointmentScreens/Models/ServiceTypes.dart';
import 'package:app_skin_mate/AppointmentScreens/doctor_Screen/select_Doctor.dart';
import 'package:flutter/material.dart';


class scheduleAppoitment extends StatefulWidget {
  @override
  _scheduleAppoitmentState createState() => _scheduleAppoitmentState();
}

class _scheduleAppoitmentState extends State<scheduleAppoitment> {
  List<Service> serve = new List<Service>();
  List<subServices> subserve = new List<subServices>();
  @override
  void initState() {
    //getSubService();
    serve.add(new Service("General Meet",'assets/user_Profile/General_Meet.png', false));
    serve.add(new Service("Daily Checkup",'assets/user_Profile/Daily_Checkup.png', false));
  }
  @override
  Widget build(BuildContext context) {
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
                ListView. separated(
                    separatorBuilder: (BuildContext context, int index)
                    { return SizedBox(width: 10.0,); },
                    shrinkWrap: true,
                    itemCount: serve.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => doctor_Selection()));
                          setState(() {
                            serve.forEach((service) => service.isSelected = false);
                            serve[index].isSelected = true;
                          });
                        },
                        child: (selectService(serve[index])),
                      );
                    }),
              ],
            ),
          ),
    );
  }
}
