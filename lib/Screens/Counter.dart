import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagment/Provider/Count_provider.dart';
class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCont();
    });

  }
  @override
  Widget build(BuildContext context) {

    final countProvider = Provider.of<CountProvider>(context,listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCont();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CountProvider>(builder: (context,value,child){
              return Text(value.count.toString(),textScaleFactor: 3,);

            })
          ],
        ),
      ),
    );
  }
}
