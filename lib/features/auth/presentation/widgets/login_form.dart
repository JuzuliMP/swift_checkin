import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_checkin/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:pinput/pinput.dart';

/// LoginForm is the main widget for user login.
/// It is composed of smaller, reusable widgets for clarity and maintainability.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passcodeController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passcodeController.dispose();
    super.dispose();
  }

  void _onRememberMeChanged(bool? value) {
    setState(() {
      _rememberMe = value ?? false;
    });
  }

  void _onLoginPressed(BuildContext context) {
    context.read<AuthCubit>().login(
          _phoneController.text,
          _passcodeController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PhoneField(controller: _phoneController),
        const SizedBox(height: 24),
        _PasscodeField(controller: _passcodeController),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _RememberMeCheckbox(
              value: _rememberMe,
              onChanged: _onRememberMeChanged,
            ),
            const _ForgotPasscodeButton(),
          ],
        ),
        const SizedBox(height: 32),
        _LoginButton(
          phoneController: _phoneController,
          passcodeController: _passcodeController,
          onPressed: () => _onLoginPressed(context),
        ),
        const SizedBox(height: 12),
        const _RegisterPrompt(),
      ],
    );
  }
}

/// Phone number input field.
class _PhoneField extends StatelessWidget {
  final TextEditingController controller;

  const _PhoneField({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone number',
          style:
              theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
          ),
        ),
      ],
    );
  }
}

/// Passcode input field using Pinput.
class _PasscodeField extends StatelessWidget {
  final TextEditingController controller;

  const _PasscodeField({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pinTheme = PinTheme(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.secondary),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Passcode',
          style:
              theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: double.infinity,
          child: Pinput(
            length: 4,
            controller: controller,
            keyboardType: TextInputType.number,
            defaultPinTheme: pinTheme,
            focusedPinTheme: pinTheme,
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }
}

/// Remember me checkbox widget.
class _RememberMeCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _RememberMeCheckbox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Checkbox(
          visualDensity: VisualDensity.compact,
          side: BorderSide(color: theme.colorScheme.secondary),
          value: value,
          onChanged: onChanged,
        ),
        Text(
          'Remember me',
          style:
              theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

/// Forgot passcode button (currently no-op).
class _ForgotPasscodeButton extends StatelessWidget {
  const _ForgotPasscodeButton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: () {
        // TODO: Implement forgot passcode logic.
      },
      child: Text(
        'Forgot Passcode?',
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w300,
          color: theme.colorScheme.primary,
          decoration: TextDecoration.underline,
          decorationColor: theme.colorScheme.primary,
        ),
      ),
    );
  }
}

/// Login button with loading indicator.
class _LoginButton extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController passcodeController;
  final VoidCallback onPressed;

  const _LoginButton({
    required this.phoneController,
    required this.passcodeController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final isLoading = state is AuthLoading;
          return ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    'Login',
                    style: theme.textTheme.titleMedium,
                  ),
          );
        },
      ),
    );
  }
}

/// Register prompt at the bottom of the form.
class _RegisterPrompt extends StatelessWidget {
  const _RegisterPrompt();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have account?",
            style: theme.textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.w300),
          ),
          const SizedBox(width: 4),
          Text(
            'Register',
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
