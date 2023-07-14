import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/ccccdddd_viewmodel.dart';
import 'package:riverpod_example/bbb_stateful_screen.dart';

// StatelessWidget에 Riverpod을 적용하려면 ConsumerWidget을 사용
class AaaStatelessScreen extends ConsumerWidget {
  const AaaStatelessScreen({super.key});

  // build 함수에 ref가 생기는게 ConsumerWidget의 특징!
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AAA Stateless Screen',
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: ref.watch(abcdProvier).cccc,
            onChanged: (value) => ref.read(abcdProvier.notifier).setCccc(value),
            title: const Text("CCCC"),
          ),
          SwitchListTile.adaptive(
            value: ref.watch(abcdProvier).dddd,
            onChanged: (value) => ref.read(abcdProvier.notifier).setDddd(value),
            title: const Text("DDDD"),
          ),
          ListTile(
            title: const Text(
              'Go to SecondScreen >>',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            tileColor: Colors.blue.shade400,
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BbbStatefulScreen(),
                ),
              ),
            },
          ),
        ],
      ),
    );
  }
}
