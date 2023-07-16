import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/eeee_model.dart';

class EeeeViewModel extends AsyncNotifier<EeeeModel> {
  EeeeModel eeeeModel = EeeeModel(
    eeee: false,
  );

  void tapEeee() async {
    state = const AsyncValue.loading(); // EeeeViewModel를 로딩 상태로 만들기

    await Future.delayed(
        const Duration(seconds: 3)); // API 호출 및 응답 대기(3초 걸린다고 가정)
    final newEeee = EeeeModel(eeee: !eeeeModel.eeee);
    eeeeModel = newEeee;
    state = AsyncValue.data(
        newEeee); //AsyncNotifier에서는 이렇게 state를 업데이트 해야 함(로딩일수도있고 에러일수도있어서)
  }

  @override
  FutureOr<EeeeModel> build() async {
    await Future.delayed(const Duration(seconds: 5));
    return eeeeModel;
  }
}

final eeeeProvider =
    AsyncNotifierProvider<EeeeViewModel, EeeeModel>(() => EeeeViewModel());
