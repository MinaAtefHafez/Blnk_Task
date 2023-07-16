



import 'package:flutter/material.dart';

extension Validation on int {
    bool isValidate(GlobalKey<FormState> formState) {
    if (formState.currentState!.validate()) {
      return true;
    }

    return false;
  }
}