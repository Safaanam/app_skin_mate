import 'package:app_skin_mate/AppointmentScreens/family_Setup_Profile/family_ProfileSetup.dart';
import 'package:app_skin_mate/AppointmentScreens/family_Setup_Profile/model_FamilyMembers.dart';
import 'package:flutter/material.dart';


class family_Members extends StatefulWidget {
  @override
  _family_MembersState createState() => _family_MembersState();
}

class _family_MembersState extends State<family_Members> {
  List<Family> fam = new List<Family>();
  @override
  void initState() {
    fam.add(new Family("shan pinto",'assets/user_Profile/family_Member.png'));
    fam.add(new Family("Tylor swift",'assets/user_Profile/family_Member.png'));
    fam.add(new Family("John perera",'assets/user_Profile/family_Member.png'));
    fam.add(new Family("ALex rodriguez",'assets/user_Profile/family_Member.png'));
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
        title: Text("Family Members",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:40.0),
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Container(
                  width: 68.0,
                  height: 20.0,
                  child: Text("Members",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff25414A)
                    ),
                  )
              ),
            ),
            SizedBox(height:10.0),
            ListView. separated(
                separatorBuilder: (BuildContext context, int index)
                { return SizedBox(height: 0.0); },
                shrinkWrap: true,
                itemCount: fam.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                      });
                    },
                    child: (familyMembers(fam[index])),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => family_SetProfile()));
          },
          child: Icon(Icons.person_add_alt),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
