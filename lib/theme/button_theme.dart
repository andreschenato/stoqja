import 'package:flutter/material.dart';

final ButtonStyle buttonTheme = ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll<Color>(Color(0XFFFF6D04)),
      foregroundColor: const WidgetStatePropertyAll<Color>(Color(0XFFf5f2f0)),
      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );