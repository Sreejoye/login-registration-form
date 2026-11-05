
import 'package:flutter/material.dart';
import '../widget/input_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() =>
      _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
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
                        Icons.app_registration,
                        size: 60,
                        color: Colors.purple,
                      ),

                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      // Name
                      InputField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        labelText: "Name",
                        hintText: "Enter your name",
                        prefixIcon: Icon(Icons.person),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter name";
                          }

                          if (!RegExp(
                            r'^[a-zA-Z ]+$',
                          ).hasMatch(value)) {
                            return "Only letters are allowed";
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      // Email
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
                            return "Invalid email";
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      // Phone
                      InputField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        labelText: "Phone Number",
                        hintText: "01XXXXXXXXX",
                        prefixIcon: Icon(Icons.phone),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter phone number";
                          }

                          if (!RegExp(
                            r'^01[3-9]\d{8}$',
                          ).hasMatch(value)) {
                            return "Invalid Bangladesh phone number";
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      // Password
                      InputField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        labelText: "Password",
                        hintText: "Enter password",
                        prefixIcon: Icon(Icons.lock),
                        obscureText: true,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }

                          if (!RegExp(
                            r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
                          ).hasMatch(value)) {
                            return "Use 8+ chars, uppercase, lowercase, number and symbol";
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      // Confirm Password
                      InputField(
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.text,
                        labelText: "Confirm Password",
                        hintText: "Enter password again",
                        prefixIcon: Icon(Icons.lock_outline),
                        obscureText: true,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please confirm password";
                          }

                          if (value != passwordController.text) {
                            return "Password does not match";
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 25),

                      // Register Button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Registration form is valid"),
                              ),
                            );
                          }
                        },
                        child: Text("Register"),
                      ),

                      SizedBox(height: 10),

                      // Back to Login
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Already have an account? Login"),
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

