import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?> showConfirmDialog(BuildContext context, String massage){
  return showDialog(
    context: context,
     builder: (ctx) => AlertDialog(title: const Text('are you sure?'),
     content: Text(massage),
     actions: <Widget>[
    TextButton(
        child: const Text('no'),
        onPressed:() {
        Navigator.of(ctx).pop(false);
      },
    ),
   TextButton(
        child: const Text('yes'),
        onPressed:() {
        Navigator.of(ctx).pop(true);
        },
      ),
    ],
  ),
 );
}
Future<bool?> showErrorDialog(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('An Error Occurred!'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('Okay'),
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        ),
      ],
    ),
  );
}