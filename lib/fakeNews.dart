import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'login_page.dart';

class FakeNews extends StatefulWidget {
  const FakeNews({super.key});

  @override
  State<FakeNews> createState() => _FakeNewsState();
}

class _FakeNewsState extends State<FakeNews> {
  TextEditingController _fakeNewsTitle = TextEditingController();
  double _pointerValue = 50.0; // Initialize to center of "Not Confirmed"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text("Enter the News Title, We Will Provide you Status Of News: ",
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: TextField(
                    controller: _fakeNewsTitle,
                    decoration: InputDecoration(
                      hintText: 'Enter Title Of News',
                      contentPadding: EdgeInsets.all(15.0),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Example logic to update gauge
                    bool? isRealNews = determineNewsType();
                    updateGauge(isRealNews);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.withOpacity(0.9),
                    elevation: 15,
                    padding:
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0,
                            endValue: 33.33,
                            color: Colors.red.withOpacity(0.8),
                            startWidth: 20, // Reduced width
                            endWidth: 20, // Reduced width
                            label: 'Fake News',
                            labelStyle: GaugeTextStyle(fontSize: 15, color: Colors.white)
                        ),
                        GaugeRange(
                            startValue: 33.33,
                            endValue: 66.66,
                            color: Colors.orange.withOpacity(0.8),
                            startWidth: 20, // Reduced width
                            endWidth: 20, // Reduced width
                            label: 'Not Confirmed',
                            labelStyle: GaugeTextStyle(fontSize: 15, color: Colors.white)),
                        GaugeRange(
                            startValue: 66.66,
                            endValue: 100,
                            color: Colors.green.withOpacity(0.8),
                            startWidth: 20, // Reduced width
                            endWidth: 20, // Reduced width
                            label: 'Real News',
                            labelStyle: GaugeTextStyle(fontSize: 15, color: Colors.white)),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(value: _pointerValue),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Container(
                            child: Text(
                              'News Status',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.9,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Example logic to determine news type (replace with your actual logic)
  bool? determineNewsType() {
    // For demonstration, randomly return true, false, or null
    return true;
  }

  void updateGauge(bool? isRealNews) {
    setState(() {
      if (isRealNews == true) {
        _pointerValue = 83.33; // Real News (Middle of Real News section)
      } else if (isRealNews == false) {
        _pointerValue = 16.66; // Fake News (Middle of Fake News section)
      } else {
        _pointerValue = 50.0; // Not Confirmed (Middle of Not Confirmed section)
      }
    });
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => login()));
  }
}
