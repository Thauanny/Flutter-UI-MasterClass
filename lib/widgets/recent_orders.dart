import 'package:flutter/material.dart';
import 'package:ui_masterclass/app_localizations.dart';
import 'package:ui_masterclass/data/data.dart';
import 'package:ui_masterclass/models/order.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleRecentOrders(l10n),
        _geralViewRecentOrder(context),
      ],
    );
  }
}

Widget _titleRecentOrders(AppLocalizations l10n) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        l10n.translate(key: 'recentOrdersText')!,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );

Widget _geralViewRecentOrder(BuildContext context) => Container(
      height: 120,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 10),
          scrollDirection: Axis.horizontal,
          itemCount: currentUser.orders.length,
          itemBuilder: (context, index) {
            Order order = currentUser.orders[index];
            return _buildRecentOrder(context, order);
          }),
    );
Widget _buildRecentOrder(BuildContext context, Order order) => Container(
      margin: EdgeInsets.all(10),
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: (Colors.grey[200])!,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                //image food
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage(order.food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                //names food, restaurant and date
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          order.date,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //button
          Container(
            margin: EdgeInsets.only(right: 20),
            width: 48,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
