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

Future positiveNotification(
  BuildContext context,
  String title, // title of the notification
  String description, // description text in the notification
  int duration, // duration in seconds
  Future<dynamic> Function()? onClosePressed, // action done on 'close' pressed
  Future<dynamic> Function()?
      onAnimationEnd, // action done on when duration elapses
) async {
// see here that ElegantNotification without any 'dot something' in front
  ElegantNotification(
    title: Text(title),
    description: Text(description),
    animationDuration: Duration(seconds: duration),
    icon: Icon(
// you can specify which icon you want, here I am using Material icons Library
      Icons.access_alarm,
      color: const Color.fromARGB(255, 90, 255, 153),
    ),
// here you specify the colour of the progress bar, I am using Orange
    progressIndicatorColor: const Color.fromARGB(255, 146, 255, 159),
// these two lines below allow actions to be triggered on close pressed or on end
    onCloseButtonPressed: onClosePressed,
    onProgressFinished: onAnimationEnd,
  ).show(context);
}
