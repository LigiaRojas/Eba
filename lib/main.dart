import 'package:flutter/material.dart';

import 'package:eba/views/loading_screen.dart';
import 'package:eba/views/login_form.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login-form',
    routes: {
      '/': (context) => LoadingScreen(),
      '/login-form': (context) => LoginForm(),
    },
  ));
}

