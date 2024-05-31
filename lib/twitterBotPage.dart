import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Twitter extends StatefulWidget {
  const Twitter({super.key});

  @override
  State<Twitter> createState() => _TwitterState();
}

class _TwitterState extends State<Twitter> {
  TextEditingController _twitterIdController = TextEditingController();
  double _pointerValue = 3.0; // Initialize to middle of the gauge

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
                Text("Enter the twiter Id, We Will Provide you Status Of Twitter Id: ",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                SizedBox(height: 25),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
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
                    // Example logic to update gauge
                    double twitterIdValue = determineTwitterIdValue();
                    updateGauge(twitterIdValue);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
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
                SizedBox(height: 20.0),
                SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 1,
                      maximum: 5,
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startValue: 1,
                          endValue: 3,
                          color: Colors.green.withOpacity(0.8),
                          startWidth: 20, // Reduced width
                          endWidth: 20, // Reduced width
                          label: 'Real Twitter ID',
                          labelStyle: GaugeTextStyle(fontSize: 12, color: Colors.black),
                        ),
                        GaugeRange(
                          startValue: 3,
                          endValue: 5,
                          color: Colors.red.withOpacity(0.8),
                          startWidth: 20, // Reduced width
                          endWidth: 20, // Reduced width
                          label: 'Fake Twitter ID',
                          labelStyle: GaugeTextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(value: _pointerValue),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Container(
                            child: Text(
                              'Twitter ID Status',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

  // Example logic to determine Twitter ID value (replace with your actual logic)
  double determineTwitterIdValue() {
    // For demonstration, return a random value between 1 and 5
    return 2;
  }

  void updateGauge(double twitterIdValue) {
    setState(() {
      _pointerValue = twitterIdValue; // Set the pointer value to the received value
    });
  }
}
