import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salforge_gate_app/core/widgets/custom_button.dart';
import 'package:salforge_gate_app/features/auth/widgets/auth_text_field.dart';

void main() {
  testWidgets('CustomButton widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: 'Test Button',
            onPressed: () {},
            variant: ButtonVariant.primary,
          ),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('AuthTextField widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AuthTextField(
            label: 'Test Email',
            hint: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ),
    );

    expect(find.text('Test Email'), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
  });
}
