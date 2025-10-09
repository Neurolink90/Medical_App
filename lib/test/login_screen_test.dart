import 'package:flutter_test/flutter_test.dart';
import 'package:medical_app/login_screen.dart';

void main() {
  testWidgets('LoginScreen has email and password fields', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
  });
}