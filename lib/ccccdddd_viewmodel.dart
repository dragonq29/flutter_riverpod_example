import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/ccccdddd_model.dart';

class CcccDdddViewModel extends Notifier<CcccDdddModel> {
  void setCccc(bool value) {
    state = CcccDdddModel(
      cccc: value,
      dddd: state.dddd,
    );
  }

  void setDddd(bool value) {
    state = CcccDdddModel(
      cccc: state.cccc,
      dddd: value,
    );
  }

  @override
  CcccDdddModel build() {
    // 기본값 설정
    return CcccDdddModel(
      cccc: true,
      dddd: true,
    );
  }
}

// 전역으로 NotifierProvider 생성
final abcdProvier = NotifierProvider<CcccDdddViewModel, CcccDdddModel>(
  () => CcccDdddViewModel(),
);
