import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DeviceFullInfo extends StatelessWidget {
  const DeviceFullInfo({Key key, @required this.device}) : super(key: key);
  final ScanResult device;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Card(
          elevation: 2,
          child: Column(children: [
            const SizedBox(height: 10),
            Text(
              device.device.name,
              style: Theme.of(context).accentTextTheme.bodyText1.copyWith(
                fontSize:20.0
              ),
            ),
            const SizedBox(height: 40),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(children: [
                Text('Id: ${device.device.id ?? 'No value'}',
                    style: Theme.of(context).primaryTextTheme.bodyText1),
                const SizedBox(height: 25),
                Text('Bluetooth Device Type: ${device.device.type.index ?? 'No value'}',
                    style: Theme.of(context).primaryTextTheme.bodyText1),
              ]),
              Column(children: [
                Text('Tx Power Level: ${device.advertisementData.txPowerLevel  ?? 'No value'}',
                    style: Theme.of(context).primaryTextTheme.bodyText1),
                const SizedBox(height: 25),
                Text('Connectable: ${device.advertisementData.connectable ?? 'No value'}',
                    style: Theme.of(context).primaryTextTheme.bodyText1),
              ])
            ])
          ]),
        ));
  }
}
