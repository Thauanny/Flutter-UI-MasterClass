import 'package:flutter/material.dart';
import 'package:ui_masterclass/app_localizations.dart';
import 'package:ui_masterclass/data/data.dart';
import 'package:ui_masterclass/widgets/recent_orders.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Food Delivery'),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor, elevation: 0),
              onPressed: () {},
              child: Text(
                'Cart(${currentUser.cart.length})',
                style: TextStyle(fontSize: 17),
              ))
        ],
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [_searchBar(context, l10n), RecentOrders()],
      ),
    );
  }
}

Widget _searchBar(BuildContext context, l10n) => Padding(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 0.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                BorderSide(width: 0.8, color: Theme.of(context).primaryColor),
          ),
          hintText: l10n.translate(key: 'searchBarText'),
          prefixIcon: Icon(
            Icons.search,
            size: 30,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {},
          ),
        ),
      ),
    );
