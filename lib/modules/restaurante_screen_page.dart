import 'package:flutter/material.dart';
import 'package:ui_masterclass/models/restaurant.dart';

class RestaurantScreenPage extends StatelessWidget {
  final Restaurant? restaurant;
  const RestaurantScreenPage({Key? key, @required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Hero(
              tag: restaurant?.imageUrl ?? '',
              child: Image(
                height: 220,
                width: MediaQuery.of(context).size.width,
                image: AssetImage(restaurant?.imageUrl ?? ''),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    iconSize: 35,
                  )
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
