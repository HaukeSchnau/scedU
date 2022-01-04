import 'package:mobx/mobx.dart';
import '../gen/basic_entity.dart';
  
part 'entity.g.dart';

class Entity = _Entity with _$Entity;

abstract class _Entity extends BasicEntity with Store {
  _Entity(
      {required String id}) : super(id: id);

  // ignore: unused_element
  _Entity.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
