// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double _currentSliderValueHeight = 0;
  double _currentSliderValueWeight = 0;
  double bmiAnswer = 0;
  String bmiStatus ='';
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bmi Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, top: 15, bottom: 5),
            child: Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              'We care about your health',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              'Height ${_currentSliderValueHeight.round()}. cm',
              style: TextStyle(fontSize: 30, color: Colors.grey),
            ),
          ),
          Slider(
            value: _currentSliderValueHeight,
            max: 200,
            label: _currentSliderValueHeight.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValueHeight = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              'Weight ${_currentSliderValueWeight.round()} Kg',
              style: TextStyle(fontSize: 30, color: Colors.grey),
            ),
          ),
          Slider(
            value: _currentSliderValueWeight,
            max: 200,
            label: _currentSliderValueWeight.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValueWeight = value;
              });
            },
          ),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  bmiAnswer = (_currentSliderValueWeight /
                      ((_currentSliderValueHeight /
                          100 *
                          _currentSliderValueHeight /
                          100)));

                  if (bmiAnswer < 18.5) {
                    setState(() {
                      
                      bmiStatus ="You're under weight";
                    });
                  }
                  else if (bmiAnswer<25){
                    
                     setState(() {
                      
                      bmiStatus ="You're normal";
                    });
                  }
                  else if (bmiAnswer<30){
                      setState(() {
                      
                      bmiStatus ="You're not normal";
                    });
                  }
                  else{
                      setState(() {
                      
                      bmiStatus ="You're obese";
                    });
                  }
                });
              },
              icon: Icon(Icons.favorite),
              label: Text('Calculate'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          bmiAnswer>0 ? 
          Center(
            child: Text(
              'BMI Answer = ${bmiAnswer.round()}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ):SizedBox(), 
          Center(child: Text(bmiStatus , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),)
        ],
      ),
    );
  }
}
