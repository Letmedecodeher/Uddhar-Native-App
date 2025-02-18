import 'package:flutter/material.dart';
import 'api_service.dart'; // Ensure this points to your ApiService class
import 'homepage.dart'; // Ensure this points to your HomePage
import 'register_page.dart'; // Ensure this points to your RegisterPage

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void loginUser() async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    try {
      // Call the login API
      var response = await ApiService.login(
        emailController.text,
        passwordController.text,
      );

      setState(() {
        isLoading = false; // Hide loading indicator
      });

      // Check if the response contains a token
      if (response != null && response['token'] != null) {
        // Navigate to HomePage with the token
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(token: response['token']),
          ),
        );
      } else {
        // Show error message if login fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: Invalid credentials')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false; // Hide loading indicator
      });
      // Show error message for exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Email Input Field
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),

            // Password Input Field
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),

            // Login Button
            isLoading
                ? CircularProgressIndicator() // Show loading indicator
                : ElevatedButton(
              onPressed: loginUser,
              child: Text("Login"),
            ),

            // Register Button
            TextButton(
              onPressed: () {
                // Navigate to RegisterPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: Text("Don't have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}

