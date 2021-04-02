import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:hypervolt_test/pages/info_device/local_widgets/device_full_info.dart';
import 'package:hypervolt_test/theme/app_theme.dart';

class InfoDevicePage extends StatelessWidget {
  const InfoDevicePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final ScanResult device = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.WHITE_COLOR,
        title: Text('Info Device'),
      ),

      body: DeviceFullInfo(device:device),
    );
  }
}