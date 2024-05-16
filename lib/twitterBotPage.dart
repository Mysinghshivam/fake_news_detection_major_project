import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Twitter extends StatefulWidget {
  const Twitter({super.key});

  @override
  State<Twitter> createState() => _TwitterState();
}

class _TwitterState extends State<Twitter> {

  TextEditingController _twitterIdController = TextEditingController();
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
                  controller: _twitterIdController,
                  decoration: InputDecoration(
                    hintText: 'Enter your Twitter ID',
                    contentPadding: EdgeInsets.all(15.0),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7), // Change background color here
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
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
}
