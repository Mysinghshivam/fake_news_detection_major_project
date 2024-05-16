import 'dart:ffi';

import 'package:fake_news_detection/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  TextEditingController _twitterIdController = TextEditingController();
  //variable define
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: appBarColor.withOpacity(0.6),
                title: Text("Guardian AI",style: TextStyle(fontSize: 27),),
                leading: Icon(Icons.security_outlined,size: 35,),
                actions: [IconButton(onPressed: (){}, icon: Icon(Icons.account_circle,size: 35,))],
                bottom: const TabBar(
                  dividerColor: Colors.blue,
                  tabs: [
                    Text("Fake News",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
                    Text("Twitter Bot",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),)
                  ],),
              ),
                body:  TabBarView(                  children: [
                    fakenews(),
                    twitterBot()
                    //Icon(Icons.directions_transit),
                  ],),
              ),
            ));
  }

  Widget fakenews(){
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      body: Center(
      ),
    );
  }

  Widget twitterBot(){
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.black.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: _twitterIdController,
            decoration: InputDecoration(
              hintText: 'Enter your Twitter ID',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.all(15.0),
              filled: true,
              fillColor: Colors.white.withOpacity(0.7), // Change background color here
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
              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 15,
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 350,),
          SizedBox(
            height: 50,
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                logout(context);
              },
              // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
              style: ElevatedButton.styleFrom(

                  elevation: 15.0,
                  textStyle: const TextStyle(color: Colors.white)),
              child: const Text('log out',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),
        ],
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
