import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

// Custom Auth Exception
class AuthException implements Exception {
  final String code;
  final String message;

  AuthException(this.code, this.message);

  @override
  String toString() => 'AuthException: $code - $message';
}

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Get current user
  User? get currentUser => _firebaseAuth.currentUser;

  // Auth state stream
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Sign up with email and password
  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // Configure settings for better reCAPTCHA handling
      if (kDebugMode) {
        _firebaseAuth.setSettings(
          appVerificationDisabledForTesting: true,
        );
      }

      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      // Handle specific reCAPTCHA errors
      if (e.code == 'recaptcha-not-enabled' ||
          e.code == 'missing-recaptcha-token' ||
          e.message?.contains('CONFIGURATION_NOT_FOUND') == true) {
        throw AuthException(
          'recaptcha-config-error',
          'reCAPTCHA configuration error. Please check Firebase console settings.',
        );
      }

      throw AuthException(
          e.code, e.message ?? 'An error occurred during sign up');
    } catch (e) {
      throw AuthException('unknown', 'An unexpected error occurred: $e');
    }
  }

  // Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      throw AuthException(
          e.code, e.message ?? 'An error occurred during sign in');
    } catch (e) {
      throw AuthException('unknown', 'An unexpected error occurred: $e');
    }
  }

  // Send password reset email
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException(
          e.code, e.message ?? 'An error occurred sending reset email');
    } catch (e) {
      throw AuthException('unknown', 'An unexpected error occurred: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(
          e.code, e.message ?? 'An error occurred during sign out');
    } catch (e) {
      throw AuthException('unknown', 'An unexpected error occurred: $e');
    }
  }

  // Delete user account
  Future<void> deleteAccount() async {
    try {
      await _firebaseAuth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw AuthException(
          e.code, e.message ?? 'An error occurred deleting account');
    } catch (e) {
      throw AuthException('unknown', 'An unexpected error occurred: $e');
    }
  }

  // Send email verification
  Future<void> sendEmailVerification() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AuthException(
          e.code, e.message ?? 'An error occurred sending verification email');
    } catch (e) {
      throw AuthException('unknown', 'An unexpected error occurred: $e');
    }
  }

  // Reload user
  Future<void> reloadUser() async {
    try {
      await _firebaseAuth.currentUser?.reload();
    } on FirebaseAuthException catch (e) {
      throw AuthException(
          e.code, e.message ?? 'An error occurred reloading user');
    } catch (e) {
      throw AuthException('unknown', 'An unexpected error occurred: $e');
    }
  }
}

// Providers
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServiceProvider).authStateChanges;
});
