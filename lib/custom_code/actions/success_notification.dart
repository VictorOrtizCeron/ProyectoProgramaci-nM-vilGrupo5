// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';

Future successNotification(
  BuildContext context,
  String title, // title of the notification
  String description, // description text in the notification
  int duration, // duration in seconds
  Future<dynamic> Function()?
      onClosePressed, // allow action to be done on 'close' pressed
  Future<dynamic> Function()?
      onAnimationEnd, // allow action to be done on when duration elapses
) async {
// It's same EXACT code for Success, Error & Info notifications
// Just change it to ElegantNotification.info for info toasts
// Just change it to ElegantNotification.error for error toasts
  ElegantNotification.success(
    title: Text(title),
    description: Text(description),
    animationDuration: Duration(seconds: duration),
    onCloseButtonPressed: onClosePressed,
    onProgressFinished: onAnimationEnd,
  ).show(context);
}
