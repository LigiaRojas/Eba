import 'package:flutter/material.dart';

import 'package:eba/views/loading_screen.dart';
import 'package:eba/views/login_form.dart';
import 'package:eba/views/camera_request.dart';
import 'package:eba/views/systems_menu.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/systems-menu',
    routes: {
      '/': (context) => LoadingScreen(),
      '/login-form': (context) => LoginForm(),
      '/camera-request': (context) => CameraRequest(),
      '/systems-menu': (context) => SystemsMenu(),
    },
  ));
}

