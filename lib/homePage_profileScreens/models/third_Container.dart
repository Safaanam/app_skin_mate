import 'package:app_skin_mate/homePage_profileScreens/privacy_Policy.dart';
import 'package:app_skin_mate/homePage_profileScreens/terms_Conditions.dart';
import 'package:flutter/material.dart';

class thirdCont {
  String bodyName;
  String imageUrl;

  thirdCont({
    this.bodyName,
    this.imageUrl,
  });
}

final List<thirdCont> field3 = [
  thirdCont(
    bodyName: 'Privacy Policy',
    imageUrl: 'assets/user_Profile/privacy_Policy.png',
  ),
  thirdCont(
    bodyName: 'Terms and Conditions',
    imageUrl: 'assets/user_Profile/terms_Conditions.png',
  ),
];

Widget buildThirdContainer(BuildContext context, int index) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60.0,
          child: GestureDetector(
            onTap: () {
              if(index == 0)
                Navigator.push(context, MaterialPageRoute(builder: (_) => privacyPolicy()));
              else
                Navigator.push(context, MaterialPageRoute(builder: (_) => termsAndConditions()));
            },
          child: ListTile(
            leading: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(),
              child: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    height: 50.0,
                    width: 50.0,
                    image: AssetImage(field3[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Text(field3[index].bodyName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.0,
                color: Color(0XFF112027),
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
      ],
    ),
  );
}
