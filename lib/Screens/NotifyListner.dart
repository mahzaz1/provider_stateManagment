import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NOtifyListner extends StatelessWidget {
   NOtifyListner({Key? key}) : super(key: key);

  ValueNotifier<int> counter = ValueNotifier<int>(0);
  ValueNotifier<bool> obsecureValue = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Notify Listner'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counter.value++;
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             ValueListenableBuilder(
                 valueListenable: counter,
                 builder: (context,value,child){
                   return Text(counter.value.toString(),textScaleFactor: 3,);
                 }
             ),

              ValueListenableBuilder(
                 valueListenable: obsecureValue,
                 builder: (context,value,child){
                   return TextFormField(
                     decoration: InputDecoration(
                       hintText: 'Password',
                       suffix: GestureDetector(
                         onTap: (){
                           obsecureValue.value = !obsecureValue.value;
                         },
                         child: Icon(obsecureValue.value? Icons.visibility_off_outlined:Icons.visibility_outlined),
                       )
                     ),
                     obscureText: obsecureValue.value,
                   );
                 }
             )
            ],
          ),
        ),
      ),
    );
  }
}
