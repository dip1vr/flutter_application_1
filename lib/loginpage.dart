import 'package:flutter/material.dart';
import 'dart:ui'; // Add this import for ImageFilter

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Key to identify the form

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'), // Title of the AppBar
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/parl.gif',
              fit: BoxFit.cover,
            ),
          ),
          // Blur effect over the background image
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Apply blur effect
              child: Container(
                color: Colors.cyanAccent.withOpacity(0), // Optional: Add a color overlay
              ),
            ),
          ),
          // Main container for the login form
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners for the card
                ),
                elevation: 10, // Shadow elevation
                shadowColor: Colors.cyanAccent, // Shadow color
                color: Colors.white, // Card background color
                child: Container(
                  width: screenWidth < 600 ? screenWidth * 0.9 : 400, // Adjust width based on screen size
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey, // Assign the form key
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Welcome text
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.0), // Spacing
                        // Username input field
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                            hintText: 'Enter your username',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username'; // Validation message
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0), // Spacing
                        // Password input field
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                          ),
                          obscureText: true, // Hide the password text
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password'; // Validation message
                            }
                            else if (value.length < 6) {
                              return 'Password must be at least 6 characters long'; // Validation message
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0), // Spacing
                        // Login button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('Login button pressed'); // Print message on button press
                              // Add your login logic here
                            }
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}