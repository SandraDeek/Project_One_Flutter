import 'package:flutter/material.dart';
import 'package:sandra_project/home.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _nameController = TextEditingController();

  void _navigateToHomePage() {
    if (_nameController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(name: _nameController.text),
        ),
      );
    } else {
      // Optionally show a message if the text field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Millionaires don't \nuse Horsescope, \nBillionaires do... ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  letterSpacing: 1.5,
                  fontFamily: 'Cinzel'),
            ),
            Center(
                child: Image.asset(
              'assets/images/bg_horsescopeimage.jpeg',
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            )),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                  labelText: 'Enter Your Name',
                  labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: _navigateToHomePage,
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    ));
  }
}
