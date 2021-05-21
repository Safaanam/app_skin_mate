import 'package:app_skin_mate/AppointmentScreens/appointmentCompleted.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class summaryScreen extends StatefulWidget {
  @override
  _summaryScreenState createState() => _summaryScreenState();
}

class _summaryScreenState extends State<summaryScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int id1 = 0;
  int id2 = 0;
  String service = 'Medical';
  String date = '6 July 2020';
  String time = '10:00';
  String timeDiff = '2 Days 1 Hrs';
  int _value = 1;
  TextEditingController _insuranceController = TextEditingController();
  TextEditingController _commentsController = TextEditingController();
  List<ListItem> _dropdownItems = [
    ListItem(1, "Self"),
    ListItem(2, "Reha Irum"),
    ListItem(3, "Zuha Fathima"),
  ];

  List<DropdownMenuItem<ListItem>>? _dropdownMenuItems;
  ListItem? _selectedItem;

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems![0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in listItems as Iterable<ListItem>) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: ImageIcon(AssetImage('assets/images/back_button.png'), color: Color(0xff02122C), size: 35,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: Text("Summary",
            style: TextStyle(
              fontFamily: 'Poppins-SemiBold',
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: Color(0xff112027),
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Divider(height: 20, thickness: 2, indent: 5, endIndent: 5, color: Color(0xffE5E7E9),),
              Container(padding: EdgeInsets.only(left: 10,right: 10,top: 15),
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Service",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xff25414A).withOpacity(0.5)
                      ),),
                    SizedBox(height: 10,),
                    Text("$service",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Color(0xff25414A)
                      ),),
                  ],),
              ),
              Divider(height: 20, thickness: 2, indent: 5, endIndent: 5, color: Color(0xffE5E7E9),),
              Container(padding: EdgeInsets.only(left: 10,right: 10,top:15),
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date & Time",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff25414A).withOpacity(0.5)
                      ),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("$date"+", "+"$time"+"EST    ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Color(0xff25414A)
                          ),),
                        Text("in $timeDiff",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xff25414A).withOpacity(0.5)
                        ),),
                      ],),
                  ],),
              ),
              Divider(height: 20, thickness: 2, indent: 5, endIndent: 5, color: Color(0xffE5E7E9),),
              Container(padding: EdgeInsets.only(left: 10, right: 10),
                height: 225,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("This Appointment is for",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xff02122C).withOpacity(0.6)
                          ),),
                      ],),
                    SizedBox(height: 10,),
                    Container(
                      height: 44,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Color(0xffCCD0D5),
                            width: 1,
                          )),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            value: _selectedItem,
                            items: _dropdownMenuItems,
                            onChanged: (dynamic value) {
                              setState(() {
                                _selectedItem = value;
                              });
                            }),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Text("Please provide Insurance details:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Color(0xff25414A)
                      ),),
                    SizedBox(height: 10,),
                    Text("Insurance",
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 14.0,
                          color: Color(0xff02122C).withOpacity(0.6)
                      ),),
                    SizedBox(height:5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                            value: 0,
                            groupValue: id1,
                            title: Text("Paying Self",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Color(0xff02122C)
                            ),),
                            onChanged: (dynamic val) {
                              setState(() {
                                id1 = 0;
                              });
                            },
                            activeColor: Color(0xff749BAD),
                            selected: false,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                            value: 1,
                            groupValue: id1,
                            title: Text("Pay with Insurance",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Color(0xff02122C)
                            ),),
                            onChanged: (dynamic val) {
                              setState(() {
                                id1 = 1;
                              });
                            },
                            activeColor: Color(0xff749BAD),
                            selected: false,
                          ),
                        ),
                      ],
                    ),
                  ],),
              ),
              Divider(height: 20, thickness: 2, indent: 5, endIndent: 5, color: Color(0xffE5E7E9),),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                height: 199,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                  SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("Insurance",
                          style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 14.0,
                              color: Color(0xff02122C).withOpacity(0.6)
                          ),),
                      ],),
                    SizedBox(height:5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center ,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                            value: 0,
                            groupValue: id2,
                            title: Text("Select from Existing",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Color(0xff02122C)
                            ),),
                            onChanged: (dynamic val) {
                              setState(() {
                                id2 = 0;
                              });
                            },
                            activeColor: Color(0xff749BAD),
                            selected: false,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                            value: 1,
                            groupValue: id2,
                            title: Text("Add new Insurance details",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Color(0xff02122C)
                            ),),
                            onChanged: (dynamic val) {
                              setState(() {
                                id2 = 1;
                              });
                            },
                            activeColor: Color(0xff749BAD),
                            selected: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("Insurance Information",
                          style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 12.0,
                              color: Color(0xff02122C).withOpacity(0.6)
                          ),),
                      ],),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 44,
                      child: TextFormField(
                          controller: _insuranceController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffCCD0D5),
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                                borderRadius: BorderRadius.circular(7.0),
                            ),
                            hintText: 'Enter Insurance Information',
                            hintStyle: TextStyle(
                              color: Color(0xff02122C).withOpacity(0.2),
                              fontSize: 12.0,
                            ),),
                          onChanged: (val) {
                            // setState(() => insurance = val);
                          }),
                    ),
                ],),
              ),
              Divider(height: 20, thickness: 2, indent: 5, endIndent: 5, color: Color(0xffE5E7E9),),
              Container(padding: EdgeInsets.only(left: 10, right:10),height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                  SizedBox(height: 10,),
                  Text("Comments (if any)",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 14.0,
                      color: Color(0xff02122C).withOpacity(0.6)
                  ),),
                  SizedBox(height:5),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 104,
                      child: TextFormField(
                        maxLines: 10,
                          controller: _commentsController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffCCD0D5),
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            hintText: 'Enter Comments',
                            hintStyle: TextStyle(
                              color: Color(0xff02122C).withOpacity(0.2),
                              fontSize: 12.0,
                            ),),
                          onChanged: (val) {
                            // setState(() => insurance = val);
                          }),
                    ),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right:10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  child: Text('CONFIRM',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Color(0xffFFFFFF),
                  ),),
                  style: ElevatedButton.styleFrom(
                    //side: BorderSide(width: 2.0, color: Color(0xff749BAD),),
                      primary: Color(0xff749BAD),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),)),
                  onPressed: () { Navigator.push(
                      context, MaterialPageRoute(builder: (_) => appoitmentComplete())); },
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
