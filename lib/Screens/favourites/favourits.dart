import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagment/Screens/favourites/favourits_List.dart';

import '../../Provider/favouriteProvider.dart';
class Favourite extends StatelessWidget {
   Favourite({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your favourites'),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FavouritsList()));
            },
              child: Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: 20,
                  itemBuilder: (context, index) {
                    return Consumer<FavouriteProvider>(builder: (context,value,child){
                      return ListTile(
                        title: Text('Item ' + '${index + 1}'),
                        trailing:  value.selectedItem.contains(index)? Icon(Icons.favorite): Icon(Icons.favorite_border),
                        onTap: (){
                          if(value.selectedItem.contains(index)){
                          value.RemoveItems(index);

                          }else{

                          value.AddItems(index);
                          }

                        },
                      );
                    });
                  }))
        ],
      ),
    );
  }
}
