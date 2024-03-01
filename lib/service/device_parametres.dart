import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:e_commerce_app/service/logger_service.dart';

Future deviceParams() async {
  Map<String, String> params = {};
  var deviceInfo = DeviceInfoPlugin();

  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    params.addAll({
      'deviceId': iosDeviceInfo.identifierForVendor!,
      'deviceType': "IOS",
      'deviceToken': "",
    });
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    params.addAll({
      'deviceId': androidDeviceInfo.id,
      'deviceType': "Android",
      'deviceToken': "",
    });
  }


  LoggerService.errorLogger(params['deviceId'].toString());



}
