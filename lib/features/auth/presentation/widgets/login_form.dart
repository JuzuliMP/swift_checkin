import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import 'passcode_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _phoneController = TextEditingController();
  final _passcodeController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone number',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            hintText: 'Enter your phone number',
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Passcode',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        PasscodeField(
          controller: _passcodeController,
          onChanged: (value) {
            setState(() {});
          },
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value ?? false;
                    });
                  },
                ),
                const Text('Remember me'),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Passcode?',
                style: TextStyle(
                  color: Color(0xFFE67E22),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state is AuthLoading
                    ? null
                    : () {
                  context.read<AuthCubit>().login(
                    _phoneController.text,
                    _passcodeController.text,
                  );
                },
                child: state is AuthLoading
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                    : const Text('Login'),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have account? "),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Color(0xFFE67E22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
