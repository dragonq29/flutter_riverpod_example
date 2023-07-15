import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/ccccdddd_model.dart';
import 'package:riverpod_example/ccccdddd_repo.dart';

class CcccDdddViewModel extends Notifier<CcccDdddModel> {
  final CcccDdddRepository _repository;

  CcccDdddViewModel(this._repository);

  void setCccc(bool value) {
    _repository.setCccc(value); // 폰 내부에 저장

    state = CcccDdddModel(
      cccc: value,
      dddd: state.dddd,
    ); // 현재 실행중인 앱에 반영
  }

  void setDddd(bool value) {
    _repository.setDddd(value); // 폰 내부에 저장

    state = CcccDdddModel(
      cccc: state.cccc,
      dddd: value,
    ); // 현재 실행중인 앱에 반영
  }

  @override
  CcccDdddModel build() {
    return CcccDdddModel(
      cccc: _repository.getCccc(),
      dddd: _repository.getDddd(),
    ); // 기본값을 폰 내부에 저장되어 있던 값으로 설정
  }
}

// 전역으로 NotifierProvider 생성
final abcdProvier = NotifierProvider<CcccDdddViewModel, CcccDdddModel>(
  () =>
      throw UnimplementedError(), // main.dart에서 시작할 때 저장됐던 값으로 재정의(override) 하는데, 재정의 안됐을 때 사용하면 UnimplementedError 띄움
);
