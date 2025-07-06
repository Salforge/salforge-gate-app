import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/services/auth_service.dart';
import '../features/auth/pages/login_page.dart';
import '../features/auth/pages/signup_page.dart';
import '../features/dashboard/pages/dashboard_page.dart';

// Router configuration
final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/login',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isAuthenticated = authState.value != null;
      final isLoggingIn = state.matchedLocation == '/login';
      final isSigningUp = state.matchedLocation == '/signup';

      // If not authenticated and not on auth pages, redirect to login
      if (!isAuthenticated && !isLoggingIn && !isSigningUp) {
        return '/login';
      }

      // If authenticated and on auth pages, redirect to dashboard
      if (isAuthenticated && (isLoggingIn || isSigningUp)) {
        return '/dashboard';
      }

      // No redirect needed
      return null;
    },
    routes: [
      // Auth Routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignUpPage(),
      ),

      // Dashboard Route
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const DashboardPage(),
      ),

      // Gate Routes
      GoRoute(
        path: '/gates',
        name: 'gates',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Gates Page - Coming Soon!'),
          ),
        ),
      ),

      // Users Routes
      GoRoute(
        path: '/users',
        name: 'users',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Users Page - Coming Soon!'),
          ),
        ),
      ),

      // Profile Route
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Profile Page - Coming Soon!'),
          ),
        ),
      ),

      // Settings Route
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Settings Page - Coming Soon!'),
          ),
        ),
      ),
    ],

    // Error handling
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Page Not Found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'The page you are looking for does not exist.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/dashboard'),
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    ),
  );
});
