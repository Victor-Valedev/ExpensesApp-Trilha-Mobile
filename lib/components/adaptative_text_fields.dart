import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextFields extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String label;
  final Function(String) onSubmitForms;

  AdaptativeTextFields({
    required this.controller,
    required this.label,
    required this.onSubmitForms,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: CupertinoTextField(
            controller: controller,
            placeholder: label,
            onSubmitted: onSubmitForms,
            keyboardType: keyboardType,
            padding: EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 12,
            ),
          ),
        )
        : TextField(
          controller: controller,
          decoration: InputDecoration(labelText: label),
          onSubmitted: onSubmitForms,
          keyboardType: keyboardType,
        );
  }
}
