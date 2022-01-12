import 'package:mobx/mobx.dart';
import '../gen/basic_abstract_event.dart';
import '../model/location.dart';
import '../model/cortex.dart';

part 'abstract_event.g.dart';

class AbstractEvent = _AbstractEvent with _$AbstractEvent;

abstract class _AbstractEvent extends BasicAbstractEvent with Store {
  _AbstractEvent(
      {required String name,
      String? description,
      Location? location,
      Cortex? category,
      AbstractEvent? original,
      required String id})
      : super(
            name: name,
            description: description,
            location: location,
            category: category,
            id: id,
            original: original);

  // ignore: unused_element
  _AbstractEvent.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
