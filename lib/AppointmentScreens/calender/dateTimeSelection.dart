import 'package:app_skin_mate/AppointmentScreens/Summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class dateTimeSelect extends StatefulWidget {
  @override
  _dateTimeSelectState createState() => _dateTimeSelectState();
}

class _dateTimeSelectState extends State<dateTimeSelect> {
  var date;
  var month;
  var year;
  Color _colorContainer = Colors.white;

  Widget buildTimeContainer(String timeVal){
    return Container(
      width: 98,
      height: 44,
      decoration: BoxDecoration(
        color: _colorContainer,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text("$timeVal", style: TextStyle(fontSize: 20, color: Color(0xff112027)),)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: new IconButton(icon: ImageIcon(AssetImage('assets/images/back_button.png'),
          color: Color(0xff02122C), size: 35,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: Text("Select Date & Time",
            style: TextStyle(//fontFamily: 'Poppins-SemiBold',
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: Color(0xff112027),
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              //margin: EdgeInsets.only(left: 0.0),
              padding: EdgeInsets.only(left: 20.0,top: 35),
              //width: double.infinity,
              child: Text('Select a date for appointment',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff25414A),
                ),
              ),
            ),
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 45)),
              lastDate: DateTime.now().add(Duration(days: 45)),
              onDateChanged: (DateTime value) {
                print(value);
                date = value.day;
                month = value.month;
                year = value.year;
                String selectedDate = year.toString()+"-"+month.toString()+"-"+date.toString();
                print('selected: $selectedDate');
              },
            ),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(left: 20.0,),
              child: Text('Available Time slots',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff25414A),
                ),
              ),
            ),
            SizedBox(height: 5,),
            ListTile(minLeadingWidth: 40,
              leading: Text('Morning', style: TextStyle(fontSize: 12, color: Color(0xff25414A),),),
              trailing: Text('Time Zone: EST', style: TextStyle(fontSize: 12, color: Color(0xff25414A),),),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("09:00"),
                    buildTimeContainer("09:10"),
                    buildTimeContainer("09:20"),
                    /*InkWell(
                    child: buildTimeContainer("09:20"),
                      onTap: () {
                        setState(() {
                          _colorContainer = Color(0xffB1BEB7);
                        });
                      }
                  ), */

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("09:30"),
                    buildTimeContainer("09:40"),
                    buildTimeContainer("09:50"),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("10:00"),
                    buildTimeContainer("10:10"),
                    buildTimeContainer("10:20"),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("10:30"),
                    buildTimeContainer("10:40"),
                    buildTimeContainer("10:50"),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("11:00"),
                    buildTimeContainer("11:10"),
                    buildTimeContainer("11:20"),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("11:30"),
                    buildTimeContainer("11:40"),
                    buildTimeContainer("11:50"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5,),
            ListTile(minLeadingWidth: 25,
              leading: Text('Afternoon', style: TextStyle(fontSize: 12, color: Color(0xff25414A),),),
            ),
            SizedBox(height: 5,),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("12:50"),
                    buildTimeContainer("01:00"),
                    buildTimeContainer("01:10"),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("01:20"),
                    buildTimeContainer("01:30"),
                    buildTimeContainer("01:40"),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("01:50"),
                    buildTimeContainer("02:00"),
                    buildTimeContainer("02:10"),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("02:20"),
                    buildTimeContainer("02:30"),
                    buildTimeContainer("02:40"),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("02:50"),
                    buildTimeContainer("03:00"),
                    buildTimeContainer("03:10"),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("03:20"),
                    buildTimeContainer("03:30"),
                    buildTimeContainer("03:40"),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("03:50"),
                    buildTimeContainer("04:00"),
                    buildTimeContainer("04:10"),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTimeContainer("04:20"),
                    buildTimeContainer("04:30"),
                    buildTimeContainer("04:40"),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                height: 60.0,
                buttonColor: Color(0xff749BAD),
                child: Container(
                  child: RaisedButton(
                    child: Text('PROCEED',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.blueGrey[100]!),
                    ),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => summaryScreen()));
                    },
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
