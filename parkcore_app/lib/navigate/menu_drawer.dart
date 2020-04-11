import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: SvgPicture.asset(
              'assets/ParkCore_WHITE_SQUIRREL.svg',
              fit: BoxFit.contain,
              semanticsLabel: 'ParkCore Logo',
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              border: Border(
                bottom: BorderSide(
                  width: 5.0,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
          _createMenuItem(
            context: context,
            icon: Icons.home,
            text: 'Home',
            route: '/home',
          ),
          _createMenuItem(
            context: context,
            icon: Icons.directions_car,
            text: 'Post a Parking Space',
            route: '/add_parking',
          ),
          _createMenuItem(
            context: context,
            icon: Icons.add_location,
            text: 'Find Parking',
            route: '/find_parking',
          ),
        ],
      ),
    );
  }
}

Widget _createMenuItem(
    {BuildContext context, IconData icon, String text, String route}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.display2,
          ),
        )
      ],
    ),
    trailing: Icon(Icons.arrow_forward),
    onTap: () {
      // Update the state of the app, then close the drawer.
      Navigator.pushReplacementNamed(context, route);
    },
  );
}
