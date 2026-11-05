
import 'package:flutter/material.dart';
import '../widget/input_field.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 330,
            child: Card(
              color: Colors.pink.shade100,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(20),

                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.purple,
                      ),

                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 25),

                      // Email Field
                      InputField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: "Email",
                        hintText: "Enter your email",
                        prefixIcon: Icon(Icons.email),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }

                          if (!RegExp(
                            r'^[\w.-]+@[\w.-]+\.\w+$',
                          ).hasMatch(value)) {
                            return "Enter a valid email";
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 20),

                      // Password Field
                      InputField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        labelText: "Password",
                        hintText: "Enter your password",
                        prefixIcon: Icon(Icons.lock),
                        obscureText: true,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }

                          if (value.length < 8) {
                            return "Password must be 8 characters";
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 25),

                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Login form is valid"),
                              ),
                            );
                          }
                        },
                        child: Text("Login"),
                      ),

                      SizedBox(height: 10),

                      // Registration Page
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RegistrationPage(),
                                ),
                              );
                            },
                            child: Text("Register"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
