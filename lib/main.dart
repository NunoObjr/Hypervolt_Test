import 'package:flutter/material.dart';
import 'package:hypervolt_test/pages/info_device/pages/info_device_page.dart';
import 'package:hypervolt_test/pages/list_devices/pages/list_devices_page.dart';
import 'package:hypervolt_test/services/services_manager.dart';
import 'package:hypervolt_test/theme/app_theme.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesManager.initServices();
  runApp(
    MaterialApp(
      title: 'Hypervolt Code Challenge',
      theme: AppTheme.LIGHT,
      initialRoute: '/',
      routes: {
        '/': (context) => ListDevicesPage(),
        '/infoDevice': (context) => InfoDevicePage(),
      })
  );
}