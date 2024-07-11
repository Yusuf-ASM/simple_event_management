// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const AuthBackendLink = Testing ? "http://127.0.0.1:8080/auth" : "https://smartapi.nu.edu.eg/auth";
const HackerBackendLink =
    Testing ? "http://127.0.0.1:8080/hacker" : "https://smartapi.nu.edu.eg/hacker";

Stream? stream;
const Version = "V1.0.0";
const Testing = false;
const TextFieldBorderRadius = 15.0;
const NormalTextSize = 16.0;
const SemiTextSize = 18.0;
const MediumTextSize = 24.0;
const BigTextSize = 32.0;

Map<String, dynamic> organizerCredentials = {};

Map<String, String> headers = {};

const mainColor = Color.fromARGB(255, 39, 178, 243);
const secondColor = Colors.blue;
const thirdColor = Color.fromARGB(255, 45, 130, 199);
