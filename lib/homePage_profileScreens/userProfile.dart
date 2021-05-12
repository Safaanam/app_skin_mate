import 'package:app_skin_mate/ProfileSetupScreens/SetProfile.dart';
import 'package:app_skin_mate/Screens/WelcomeScreen.dart';
import 'package:app_skin_mate/homePage_profileScreens/models/first_Container.dart';
import 'package:app_skin_mate/homePage_profileScreens/models/second_Container.dart';
import 'package:app_skin_mate/homePage_profileScreens/models/third_Container.dart';
import 'package:flutter/material.dart';


class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xffECEFF3),
          child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 60.0),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 102.0,
              child: GestureDetector(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SetProfile()));
                },
              child: ListTile(
                leading: Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image(
                      height: 80.0,
                      width: 80.0,
                      image: AssetImage('assets/user_Profile/person.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              title: Text("Naleem Gill",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                  color: Color(0xff112027),
                ),
              ),
              subtitle: Text("View / Edit Profile",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff02122C),
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                iconSize: 30.0,
                onPressed: () => {}
              ),
            ),
            ),
            ),
            SizedBox(height: 10.0),
            buildFirstContainer(context, 0),
            buildFirstContainer(context,1),
            SizedBox(height: 10.0),
            buildSecondContainer(context,0),
            buildSecondContainer(context,1),
            SizedBox(height: 10.0),
            buildThirdContainer(context,0),
            buildThirdContainer(context,1),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => WelcomeScreen()));
                      },
                        child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text("Logout",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color(0xffA2071E)
                      ),)),
                    ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
