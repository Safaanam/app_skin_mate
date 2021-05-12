import 'package:app_skin_mate/AppointmentScreens/calender/dateTimeSelection.dart';
import 'package:app_skin_mate/AppointmentScreens/doctor_Screen/doctor_Model.dart';
import 'package:flutter/material.dart';


class doctor_Selection extends StatefulWidget {
  @override
  _doctor_SelectionState createState() => _doctor_SelectionState();
}

class _doctor_SelectionState extends State<doctor_Selection> {
  List<Doctor> doc = new List<Doctor>();
  bool docSelected= false;
  var docname;
  @override
  void initState() {
    doc.add(new Doctor("mahammad","shafi","Mbbs",'assets/user_Profile/General_Meet.png', false));
    doc.add(new Doctor("mahammad","shafi","Mbbs",'assets/user_Profile/General_Meet.png', false));
    doc.add(new Doctor("mahammad","shafi","Mbbs",'assets/user_Profile/General_Meet.png', false));
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
        title: Text("Select Doctor",
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
              SizedBox(height:60.0),
              ListView. separated(
                  separatorBuilder: (BuildContext context, int index)
                  { return SizedBox(height: 20.0,); },
                  shrinkWrap: true,
                  itemCount: doc.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => dateTimeSelect()));
                        setState(() {
                          doc.forEach((service) => service.isSelected = false);
                          doc[index].isSelected = true;
                          docSelected= true;
                          docname=doc[index].firstname;
                        });
                      },
                      child: (selectDoctor(doc[index])),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: ButtonTheme(
                  child: Container(
                    width: 335.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: docSelected
                              ? Color(0xff749BAD)
                              : Colors.blueGrey[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),)),
                      child: Text('PROCEED',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xffFFFFFF),
                        ),),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }
}
