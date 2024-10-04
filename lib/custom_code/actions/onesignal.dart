// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:onesignal_flutter/onesignal_flutter.dart';

Future onesignal() async {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("df8de0af-f1d2-4eaa-b909-155c63f30321");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
// OneSignal.Notifications.requestPermission(true);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
