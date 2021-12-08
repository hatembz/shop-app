import 'package:flutter/material.dart';
import 'package:shop/main.dart';
import 'package:shop/network/cache_helper.dart';
import 'package:shop/shared/constants.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(
          'logout',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        onPressed: () => setState(() {
          CacheHelper.setData(key: 'token', data: '');
        }),
      ),
    );
  }
}
