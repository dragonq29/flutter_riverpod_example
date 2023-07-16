import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/ccccdddd_viewmodel.dart';
import 'package:riverpod_example/eeee_viewmodel.dart';

// StatefulWidget에 Riverpod을 적용하려면 ConsumerStatefulWidget을 사용
class BbbStatefulScreen extends ConsumerStatefulWidget {
  const BbbStatefulScreen({super.key});

  @override
  BbbStatefulScreenState createState() => BbbStatefulScreenState();
}

// ConsumerState 안에서는 어디서나 ref 호출 가능
class BbbStatefulScreenState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BBB Stateful Screen',
        ),
        backgroundColor: const Color(0xFFE9435A),
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
          ref.watch(eeeeProvider).when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(
                    "Could not load value: $error",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                data: (eeeeModel) => SwitchListTile.adaptive(
                  value: eeeeModel.eeee,
                  onChanged: (value) =>
                      ref.read(eeeeProvider.notifier).tapEeee(),
                  title: const Text("EEEE"),
                ),
              ),
        ],
      ),
    );
  }
}
