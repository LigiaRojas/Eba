import 'package:eba/views/camera_request.dart';
import 'package:flutter/material.dart';

import 'package:eba/views/loading_screen.dart';
import 'package:eba/views/login_form.dart';
import 'package:eba/views/camera_request.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/camera-request',
    routes: {
      '/': (context) => LoadingScreen(),
      '/login-form': (context) => LoginForm(),
      '/camera-request': (context) => CameraRequest(),
    },
  ));
}

