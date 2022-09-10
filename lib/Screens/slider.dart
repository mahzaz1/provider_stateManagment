import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/slider_provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({Key? key}) : super(key: key);

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {


  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(builder: (context,value,child){
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.sliderValue,
                  onChanged: (val){
                    value.SetSlider(val);
                  });
            }),

            Consumer<SliderProvider>(builder: (context,value,child){
              return Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.red.withOpacity(value.sliderValue),
                        height: 100,
                      )
                  ),

                  Expanded(
                      child: Container(
                        color: Colors.green.withOpacity(value.sliderValue),
                        height: 100,
                      )
                  ),
                ],
              );
            })


          ],
        ),
      ),
    );
  }
}
