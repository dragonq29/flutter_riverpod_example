import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/aaa_stateless_screen.dart';
import 'package:riverpod_example/ccccdddd_repo.dart';
import 'package:riverpod_example/ccccdddd_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // 앱을 껐다 켜도 값이 저장되어 있도록 하기 위해 shared_preferences 패키지 사용
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final repository = CcccDdddRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        abcdProvier.overrideWith(() => CcccDdddViewModel(repository))
      ], // 폰 내부에 저장되어 있던 값으로 값 적용
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Riverpod Example',
      home: AaaStatelessScreen(),
    );
  }
}
