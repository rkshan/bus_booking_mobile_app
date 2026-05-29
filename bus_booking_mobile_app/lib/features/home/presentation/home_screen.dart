import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../presentation/home_widget/common_button_widget.dart';
import '../../../core/auth/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.home,
              size: 80,
              color: Colors.blue,
            ),

            SizedBox(height: 20),

            Text(
              'Welcome to Home Screen',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              'You are successfully logged in',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            CommonButtonWidget(
            text: "Logout",
            onPressed: () async {
              await context.read<AuthProvider>().logoutProvider();

              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
          ],
        ),
      ),
    );
  }
}