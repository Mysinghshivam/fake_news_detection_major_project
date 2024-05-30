import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class FakeNews extends StatefulWidget {
  const FakeNews({super.key});

  @override
  State<FakeNews> createState() => _FakeNewsState();
}

class _FakeNewsState extends State<FakeNews> {
  TextEditingController _fakeNewsTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)
                ),
                child: TextField(
                  controller: _fakeNewsTitle,
                  decoration: InputDecoration(
                    hintText: 'Enter Title Of News',
                    contentPadding: EdgeInsets.all(15.0),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7), // Change background color here
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  logout(context);
                  // Handle button press
                  // For example, you can access entered Twitter ID using _twitterIdController.text
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.withOpacity(0.9),
                  elevation: 15,
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => login()));
  }
}
