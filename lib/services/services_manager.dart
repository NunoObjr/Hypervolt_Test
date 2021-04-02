import 'package:location_permissions/location_permissions.dart';

class ServicesManager {
  static Future<void>  initServices() async{
    
    PermissionStatus permission = await LocationPermissions().checkPermissionStatus();
    if(permission.index !=2)
    await LocationPermissions().requestPermissions();
  }
}
