import 'package:flutter/material.dart';

void snackBarError({
  String? msg,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("$msg"), const Icon(Icons.lock)],
      ),
    ),
  );
}
