import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/favouriteProvider.dart';

class FavouritsList extends StatelessWidget {
  FavouritsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('re-build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Your favourites'),
      ),
      body: Column(
        children: [
          Expanded(child:
              Consumer<FavouriteProvider>(builder: (context, value, child) {
            return ListView.builder(
                itemCount: value.selectedItem.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item ' + '${index + 1}'),
                    trailing: value.selectedItem.contains(index)
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    onTap: () {
                      if (value.selectedItem.contains(index)) {
                        value.RemoveItems(index);
                      } else {
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
