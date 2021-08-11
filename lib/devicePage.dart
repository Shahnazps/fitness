import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert' show json;
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DevicePage extends StatefulWidget {
  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  void connectWithGoogleFit() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
        // clientId:
        //     '741489626072-e4e97kqpiudfpttepic5d8mkq02vmghq.apps.googleusercontent.com',
        // scopes: <String>[
        //   'email',
        //   'https://www.googleapis.com/auth/fitness.activity.read',
        // ]
        );
    // try {
    //   print("Signing in");
    //   await googleSignIn.signIn();
    // } catch (error) {
    //   print("Error $error");
    // }
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    print("Felixa : googleUser $googleUser");
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    String serverAuthToken = googleSignInAuthentication.serverAuthCode;
    print('token');
    print(serverAuthToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Devices"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Center(
            //   child: Container(
            //     height: SizeConfig.safeBlockVertical * 45,
            //     child: Image(
            //       image: AssetImage("Assets/images/fitness.png"),
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // ),

            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text(
                  "Its a great place to keep all your fitness activities",
                  // style: TextStyle(
                  //     // color: Colors.white,
                  //     fontWeight: AppConfig.textCaptionWeight,
                  //     fontStyle: FontStyle.italic,
                  //     fontSize: AppConfig.textCaptionSize),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Expanded(
              //child: Card(margin: EdgeInsets.all(10),elevation: 5,

              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8.0, 20, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            leading: Icon(
                              Icons.watch,
                              size: 30,
                            ),
                            title: Text(
                              'Google Fit',
                              // style:
                              //     TextStyle(fontSize: AppConfig.subTitleSize),
                            ),
                          ),
                        ),
                        Spacer(),
                        FlatButton(
                          child: Text(
                            'Connect',
                            style: TextStyle(
                              color: Colors.white,
                              // fontSize: AppConfig.textSubtitle3Size,
                              // fontWeight: AppConfig.textHeadlineWeight,
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                              //side: BorderSide(color: Colors.black),
                              ),
                          color: Colors.purple,
                          onPressed: () {
                            connectWithGoogleFit();
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
            //),
          ],
        ),
      ),
    );
  }
}
