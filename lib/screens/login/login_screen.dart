import 'package:flutter/material.dart';
import 'package:rent_house/screens/login/sign_up_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SignUpWidget()

  );

  Widget buildLoading() => Stack(
    fit: StackFit.expand,
    children: [
      Center(child: CircularProgressIndicator()),
    ],
  );
}
