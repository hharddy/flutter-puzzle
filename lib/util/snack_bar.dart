import 'package:flutter/material.dart';

SnackBar errorSnackBar({required String error}) {
  return SnackBar(
    content: Text(error, style: const TextStyle(color: Colors.white)),
    backgroundColor: Colors.red,
    showCloseIcon: true,
    dismissDirection: DismissDirection.horizontal,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ),
  );
}

SnackBar successSnackBar({required String message}) {
  return SnackBar(
    content: Text(message, style: const TextStyle(color: Colors.white)),
    backgroundColor: Colors.green,
    showCloseIcon: true,
    dismissDirection: DismissDirection.horizontal,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ),
  );
}
