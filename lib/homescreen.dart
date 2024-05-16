import 'dart:ffi';

import 'package:fake_news_detection/login_page.dart';
import 'package:fake_news_detection/twitterBotPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

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
                    Twitter()
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




  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => login()));
  }
}
