import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/services/auth_service.dart';
import '../features/auth/pages/login_page.dart';
import '../features/auth/pages/signup_page.dart';
import '../features/dashboard/pages/dashboard_page.dart';
import '../features/splash/pages/splash_page.dart';

// Router configuration
final goRouterProvider = Provider<GoRouter>((ref) {
  // Commenting out auth state watching
  // final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // Comment out authentication checks
      // final isAuthenticated = authState.value != null;
      // final isLoggingIn = state.matchedLocation == '/login';
      // final isSigningUp = state.matchedLocation == '/signup';
      final isSplash = state.matchedLocation == '/';

      // Allow access to splash screen
      if (isSplash) {
        return null;
      }

      // Always redirect to dashboard except for splash screen
      if (!isSplash) {
        return '/dashboard';
      }

      // No redirect needed
      return null;
    },
    routes: [
      // Splash Route
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),

      // Dashboard Route (moved up since it's now the main destination)
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const DashboardPage(),
      ),

      // Auth Routes (kept but won't be used due to redirect)
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
