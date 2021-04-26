import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedInWidget extends StatefulWidget {
  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {


  FirebaseAuth _auth = FirebaseAuth.instance;

  @override

  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Spacer(),
          Text(
            'Welcome to ReadyMyCourse',
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              signOut();
            },
            child: Text(
              "Logout",
              style: TextStyle(color: Colors.white,fontSize: 15),
            ),
          )

        ],
      ),
    );
  }

  Future signOut() async {
    try{


      return await _auth.signOut();

    } catch(e){
      print(e.toString());
      return null;
    }
  }

}
