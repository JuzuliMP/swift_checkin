import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_checkin/core/routes/app_routes.dart';
import 'package:swift_checkin/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:swift_checkin/features/auth/presentation/widgets/login_form.dart';

/// The main login page, responsible for handling authentication state and displaying the login UI.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: _authListener,
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: _LoginBody(),
          ),
        ),
      ),
    );
  }

  /// Handles authentication state changes.
  void _authListener(BuildContext context, AuthState state) {
    if (state is AuthSuccess) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } else if (state is AuthError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  }
}

/// The body of the login page, containing the header and login form.
class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 48),
          _LoginHeader(),
          SizedBox(height: 48),
          LoginForm(),
        ],
      ),
    );
  }
}

/// The header section of the login page, displaying the title and subtitle.
class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'Login',
          style: theme.textTheme.headlineLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Welcome back to your account',
          style: theme.textTheme.titleLarge,
        ),
      ],
    );
  }
}
