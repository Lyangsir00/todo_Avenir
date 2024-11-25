import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_2/screens/Auth/screens/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  String fullName = "";
  String email = "";
  String phone = "";
  String password = "";
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  registration() async {
    if (_fullNameController.text != "" && _emailController.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registered successfully")));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          // Show a message if the email is already in use
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("The email is already in use")));
        } else {
          // Handle other possible FirebaseAuthException errors here
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Registration failed: ${e.message}")));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          width: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign up",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                const Text(
                  "Please fill the details and create an account",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Full name is required';
                    }

                    if (RegExp(r"\d").hasMatch(value)) {
                      return 'Numbers are not allowed';
                    }

                    if (value.length < 5) {
                      return 'Full name must be 5';
                    }

                    if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                      return 'Full name must contain only alphabets';
                    }

                    return null; // Input is valid
                  },
                  controller: _fullNameController,
                  decoration: InputDecoration(
                      hintText: "Fullname",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }

                    // Check if email starts with a number
                    if (RegExp(r"^\d").hasMatch(value)) {
                      return 'Email must not start with a number';
                    }

                    // Regular expression to validate email structure
                    if (!RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }

                    return null; // Input is valid
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: "E-mail",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }

                    // Check if the phone number contains only digits
                    if (!RegExp(r"^\d+$").hasMatch(value)) {
                      return 'Phone number must contain only numbers';
                    }

                    // Check if the phone number is exactly 10 digits
                    if (value.length < 10) {
                      return 'Phone number must be  10 digits ';
                    }

                    return null; // Input is valid
                  },
                  controller: _phoneController,
                  decoration: InputDecoration(
                      hintText: "Phone",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }

                    // Check for minimum length
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }

                    // Check for at least one uppercase letter
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return 'Password must contain at least one uppercase letter';
                    }

                    // Check for at least one lowercase letter
                    if (!RegExp(r'[a-z]').hasMatch(value)) {
                      return 'Password must contain at least one lowercase letter';
                    }

                    // Check for at least one digit
                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return 'Password must contain at least one number';
                    }

                    // Check for at least one special symbol
                    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return 'Password must contain at least one special symbol';
                    }

                    return null; // Input is valid
                  },
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        email = _emailController.text;
                        fullName = _fullNameController.text;
                        password = _passwordController.text;
                        phone = _phoneController.text;
                      });
                    }
                    registration();
                  },
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    // width: MediaQuery.of(context).size.width, // Full screen width
                    // height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue),
                    child: const Center(
                      child: Text(
                        "Sign-up",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
