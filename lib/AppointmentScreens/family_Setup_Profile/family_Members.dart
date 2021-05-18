import 'package:app_skin_mate/AppointmentScreens/family_Setup_Profile/familyModel.dart';
import 'package:app_skin_mate/AppointmentScreens/family_Setup_Profile/family_ProfileSetup.dart';
import 'package:flutter/material.dart';

class family_Members extends StatefulWidget {
  @override
  _family_MembersState createState() => _family_MembersState();
}

class _family_MembersState extends State<family_Members> {
  @override
  void initState() {
    getFamilyInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Image.asset('assets/Profile_Images/arrow_back.png')),
        ),
        title: Text(
          "Family Members",
          style: TextStyle(
            color: Color(0xff112027),
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                  width: 68.0,
                  height: 20.0,
                  child: Text(
                    "Members",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff25414A)),
                  )),
            ),
            SizedBox(height: 10.0),
            FutureBuilder<List<familyMembers>>(
                future: getFamilyInfo(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: Text(
                      'click on button below to add family members',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff25414A)),
                    ));
                  } else {
                    return Container(
                      child: ListView.separated(
                          itemCount: snapshot.data.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20.0,
                            );
                          },
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 75.0,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFE5E7E9)),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30.0, right: 40.0),
                                        child: Center(
                                          child: Image(
                                            height: 50.0,
                                            width: 50.0,
                                            image: AssetImage('assets/user_Profile/family_Member.png'),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Container(
                                        height: 50.0,
                                        width: 80.0,
                                        child: Text("${snapshot.data[index].firstName}" + " " + "${snapshot.data[index].lastName}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                            color: Color(0XFF112027),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 110.0, bottom: 10.0),
                                      child: Container(
                                        child: GestureDetector(
                                            onTap: () {
                                              bottomscreen(context);
                                            },
                                            child: Text(
                                              "...",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30.0,
                                                color: Color(0XFF687181),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => family_SetProfile()));
          },
          child: Icon(Icons.person_add_alt),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
