
import 'package:flutter/material.dart';
import 'package:myproject/AllApp/NavigationDrawer.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        drawer: NavigationDrawer(),
        body:  Container(
            color: Colors.grey,
          ),

      ),
    );
  }
}
