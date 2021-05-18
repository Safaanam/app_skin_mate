import 'package:app_skin_mate/AppointmentScreens/calender/dateTimeSelection.dart';
import 'package:app_skin_mate/AppointmentScreens/doctor_Screen/doctorModel.dart';
import 'package:flutter/material.dart';


class doctor_Selection extends StatefulWidget {
  @override
  _doctor_SelectionState createState() => _doctor_SelectionState();
}

class _doctor_SelectionState extends State<doctor_Selection> {
  Future<List<doctors>> docs;
  bool docSelected= false;
  var docname;
  int _selectedIndex = 0;

  @override
  void initState() {
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    String _backgroundImage;
    String setImage() {
      if(docSelected == true)
        _backgroundImage = "assets/user_Profile/ticked.png";
      else
        _backgroundImage = "assets/user_Profile/plain.jpg";
      return _backgroundImage;
    }
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
              FutureBuilder<List<doctors>>(
                  future: getDoctor(),
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
                              onTap: () {
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => dateTimeSelect()));
                                  docSelected=true;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 75.0,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFE5E7E9)),
                                  color:Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left:30.0,right: 40.0),
                                        child: Center(
                                          child: Image(
                                            height: 50.0,
                                            width: 50.0,
                                            image: AssetImage('assets/user_Profile/doc.png'),
                                          ),
                                        )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Text("${snapshot.data[index].firstName}" + " " + "${snapshot.data[index].lastName}"
                                          + "," + "\n" + "${snapshot.data[index].designation}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          color: Color(0XFF112027),
                                        ),
                                      ),
                                    ),
                                    /*Padding(
                                        padding: const EdgeInsets.only(left: 75.0),
                                        child: Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(setImage()))
                                    ),*/
                                  ],
                                ),
                              ),
                            );
                          }
                        ),
                      );
                    }
                  }),
              /*Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: ButtonTheme(
                  child: Container(
                    width: 335.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => dateTimeSelect()));
                      },
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
              ),*/

            ],
          ),
        ),
    );
  }
}
