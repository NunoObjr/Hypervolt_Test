import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:hypervolt_test/pages/list_devices/local_widgets/device_info_widget.dart';
import 'package:hypervolt_test/theme/app_theme.dart';

class ListDevicesPage extends StatefulWidget {
  @override
  _ListDevicesPageState createState() => _ListDevicesPageState();
}

class _ListDevicesPageState extends State<ListDevicesPage> {
  bool searching = false;
  FlutterBlue flutterBlueInstance = FlutterBlue.instance;
  List<ScanResult> devices = [];

  Future<void> _populateDeviceInfo() async {
    flutterBlueInstance.scanResults.forEach((element) {
      element.forEach((device) {
        if (!devices.contains(device)) {
          setState(() {
            devices.add(device);
          });
        }
      });
    });
    await flutterBlueInstance.stopScan();
    setState(() {
      searching = false;
    });
  }

  Future<void> _searchDevices() async {
    setState(() {
      searching = true;
    });
    await flutterBlueInstance.startScan(timeout: Duration(seconds: 5));
    await _populateDeviceInfo();
    setState(() {
      searching = false;
    });
  }

  Future<void> _stopSearching() async {
    await flutterBlueInstance.stopScan();
    setState(() {
      searching = false;
    });
  }

  @override
  void initState() {
    _searchDevices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  AppTheme.WHITE_COLOR,
        title: Text('Listed Devices Availables'),
      ),
      floatingActionButton: searching
          ? FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: _stopSearching,
              backgroundColor: AppTheme.CANCEL_BUTTON_COLOR,
            )
          : FloatingActionButton(
              child: Icon(Icons.refresh), onPressed: _searchDevices),
      body: searching
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppTheme.PRIMARY_COLOR)))
          : Container(
              child: ListView.builder(
                  itemCount: devices.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return DeviceInfo(device: devices[index]);
                  }),
            ),
    );
  }
}
