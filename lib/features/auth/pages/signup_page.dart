import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_text_field.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  bool _agreeToTerms = false;
  bool _subscribeToNewsletter = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (!_formKey.currentState!.validate()) return;

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Please agree to the Terms of Service and Privacy Policy'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    await ref.read(authControllerProvider.notifier).signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
        );
  }

  void _navigateToLogin() {
    context.push('/login');
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    // Listen for auth state changes
    ref.listen<AuthState>(authControllerProvider, (previous, next) {
      if (next.isAuthenticated) {
        context.go('/dashboard');
      } else if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: AppColors.error,
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 48,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),

                      // Logo and Title
                      _buildHeader(),

                      const SizedBox(height: 32),

                      // Sign Up Form
                      _buildSignUpForm(authState),

                      const Spacer(),

                      // Login Link
                      _buildLoginLink(),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // App Logo
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            gradient: AppColors.primaryGradient,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.security,
            size: 40,
            color: AppColors.onPrimary,
          ),
        ),

        const SizedBox(height: 24),

        // Title
        const Text(
          'Create Account',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 8),

        // Subtitle
        const Text(
          'Sign up to get started',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpForm(AuthState authState) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email Field
          AuthTextField(
            label: 'Email',
            hint: 'Enter your email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            focusNode: _emailFocusNode,
            isRequired: true,
            validator: AuthValidators.validateEmail,
            prefixIcon: const Icon(Icons.email_outlined),
            onSubmitted: (_) => _passwordFocusNode.requestFocus(),
          ),

          const SizedBox(height: 20),

          // Password Field
          AuthTextField(
            label: 'Password',
            hint: 'Enter your password',
            controller: _passwordController,
            isPassword: true,
            textInputAction: TextInputAction.next,
            focusNode: _passwordFocusNode,
            isRequired: true,
            validator: AuthValidators.validatePassword,
            prefixIcon: const Icon(Icons.lock_outline),
            onSubmitted: (_) => _confirmPasswordFocusNode.requestFocus(),
          ),

          const SizedBox(height: 20),

          // Confirm Password Field
          AuthTextField(
            label: 'Confirm Password',
            hint: 'Confirm your password',
            controller: _confirmPasswordController,
            isPassword: true,
            textInputAction: TextInputAction.done,
            focusNode: _confirmPasswordFocusNode,
            isRequired: true,
            validator: (value) => AuthValidators.validateConfirmPassword(
              value,
              _passwordController.text,
            ),
            prefixIcon: const Icon(Icons.lock_outline),
            onSubmitted: (_) => _handleSignUp(),
          ),

          const SizedBox(height: 24),

          // Password Requirements
          _buildPasswordRequirements(),

          const SizedBox(height: 24),

          // Terms and Conditions
          _buildTermsAndConditions(),

          const SizedBox(height: 16),

          // Newsletter Subscription
          _buildNewsletterSubscription(),

          const SizedBox(height: 32),

          // Sign Up Button
          CustomButton(
            text: 'Create Account',
            onPressed: authState.isLoading ? null : _handleSignUp,
            isLoading: authState.isLoading,
            isFullWidth: true,
            height: 56,
            variant: ButtonVariant.primary,
          ),

          const SizedBox(height: 24),

          // Divider
          Row(
            children: [
              const Expanded(child: Divider(color: AppColors.border)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'or',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
              const Expanded(child: Divider(color: AppColors.border)),
            ],
          ),

          const SizedBox(height: 24),

          // Social Login Buttons
          _buildSocialLoginButtons(),
        ],
      ),
    );
  }

  Widget _buildPasswordRequirements() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Password Requirements:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          _buildRequirementItem('At least 6 characters long'),
          _buildRequirementItem('Contains uppercase and lowercase letters'),
          _buildRequirementItem('Contains at least one number'),
          _buildRequirementItem('Contains at least one special character'),
        ],
      ),
    );
  }

  Widget _buildRequirementItem(String requirement) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 16,
            color: AppColors.success,
          ),
          const SizedBox(width: 8),
          Text(
            requirement,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermsAndConditions() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: _agreeToTerms,
          onChanged: (value) {
            setState(() {
              _agreeToTerms = value ?? false;
            });
          },
          activeColor: AppColors.primary,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _agreeToTerms = !_agreeToTerms;
              });
            },
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
                children: [
                  const TextSpan(text: 'I agree to the '),
                  TextSpan(
                    text: 'Terms of Service',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNewsletterSubscription() {
    return Row(
      children: [
        Checkbox(
          value: _subscribeToNewsletter,
          onChanged: (value) {
            setState(() {
              _subscribeToNewsletter = value ?? false;
            });
          },
          activeColor: AppColors.primary,
        ),
        const Expanded(
          child: Text(
            'Subscribe to our newsletter for updates and tips',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLoginButtons() {
    return Column(
      children: [
        CustomButton(
          text: 'Sign up with Google',
          onPressed: () {
            // TODO: Implement Google Sign Up
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Google Sign Up - Coming Soon!')),
            );
          },
          variant: ButtonVariant.outline,
          isFullWidth: true,
          height: 56,
          icon: const Icon(Icons.g_mobiledata, size: 24),
        ),
        const SizedBox(height: 16),
        CustomButton(
          text: 'Sign up with Apple',
          onPressed: () {
            // TODO: Implement Apple Sign Up
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Apple Sign Up - Coming Soon!')),
            );
          },
          variant: ButtonVariant.outline,
          isFullWidth: true,
          height: 56,
          icon: const Icon(Icons.apple, size: 24),
        ),
      ],
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: _navigateToLogin,
          child: const Text(
            'Sign In',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
