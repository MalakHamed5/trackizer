import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackizer/core/utils/device_utils.dart';
import 'package:trackizer/features/auth/presentation/widgets/auth_header.dart';
import 'package:trackizer/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:trackizer/features/auth/presentation/widgets/primary_button.dart';

import '../../../../core/cofig/routes/app_router.dart';

class SignUpWithEmil extends StatefulWidget {
  const SignUpWithEmil({super.key});

  @override
  State<SignUpWithEmil> createState() => _SignUpWithEmilState();
}

class _SignUpWithEmilState extends State<SignUpWithEmil> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    nameController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  Future<void> _handleSignUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      context.push(AppRouter.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthHeader(),
                  SizedBox(height: DeviceUtils.getScreenHeight(context) * 0.15),
                  
                  // Title
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sign up to get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  SizedBox(height: 30),

                  // Name field
                  AuthTextField(
                    name: 'Full Name',
                    controller: nameController,
                    validator: _validateName,
                  ),
                  SizedBox(height: 15),

                  // Email field
                  AuthTextField(
                    name: 'Email Address',
                    controller: emailController,
                    validator: _validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 15),

                  // Password field
                  _buildPasswordField(
                    name: 'Password',
                    controller: passController,
                    validator: _validatePassword,
                    isVisible: _isPasswordVisible,
                    onToggleVisibility: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  SizedBox(height: 15),

                  // Confirm Password field
                  _buildPasswordField(
                    name: 'Confirm Password',
                    controller: confirmPassController,
                    validator: _validateConfirmPassword,
                    isVisible: _isConfirmPasswordVisible,
                    onToggleVisibility: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),

                  SizedBox(height: 30),
                  
                  // Sign up button
                  PrimaryButton(
                    onPressed: _isLoading ? null : _handleSignUp,
                    txt: _isLoading ? "Creating Account..." : "Get Started, it's free!",
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Terms text
                  Text(
                    'By signing up, you agree to our Terms of Service and Privacy Policy',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: 30),
                  
                  // Sign in link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(AppRouter.signin);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String name,
    required TextEditingController controller,
    required String? Function(String?) validator,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 14,
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: !isVisible,
          validator: validator,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible ? Icons.visibility_off : Icons.visibility,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              onPressed: onToggleVisibility,
            ),
          ),
        ),
      ],
    );
  }
}
