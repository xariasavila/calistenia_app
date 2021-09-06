import 'package:flutter/material.dart';

const primaryColor = Color(0xFFf90727);
const secondaryColor = Color(0xFFFE9901);
const contentColorLightTheme = Color(0xFF000000);
const contentColorDarkTheme = Color(0xFFF5FCF9);
const warninngColor = Color(0xFFF3BB1C);
const errorColor = Color(0xFFF03738);

const defaultPadding = 16.0;

const logoDarkTheme = "assets/icons/Only_logo_dark_theme.svg";
const logoLightTheme = "assets/icons/Only_logo_light_theme.svg";

const requiredField = "This field is required";
const invalidEmail = "Enter a valid email address";

const InputDecoration otpInputDecoration = InputDecoration(
  filled: false,
  border: UnderlineInputBorder(),
  hintText: "0",
);

// For demo

final List<String> demoContactsImage =
    List.generate(5, (index) => "assets/images/user_${index + 1}.png");
