import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:hypervolt_test/theme/app_theme.dart';

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({Key key, @required this.device}) : super(key: key);
  final ScanResult device;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.of(context).pushNamed('/infoDevice',arguments: device),
        child: Container(
          color: AppTheme.CARD_COLOR,
            height: 45,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Name:', style: Theme.of(context).primaryTextTheme.bodyText1),
                  Text(device?.device?.name,
                      style: Theme.of(context).primaryTextTheme.bodyText1),
                  Text('Id:', style: Theme.of(context).primaryTextTheme.bodyText1),
                  Text(device?.device?.id?.id,
                      style: Theme.of(context).primaryTextTheme.bodyText1)
                ],
              
            )));
  }
}
