import 'dart:async';

import 'package:mobx/mobx.dart';

part 'date_store.g.dart';

final dateStore = DateStore();

class DateStore = _DateStore with _$DateStore;

abstract class _DateStore with Store {
  @observable
  DateTime currentDate = DateTime.now();

  _DateStore() {
    Timer.periodic(const Duration(seconds: 1), (timer) => updateTime());
  }

  @action
  void updateTime() {
    currentDate = DateTime.now();
  }
}
