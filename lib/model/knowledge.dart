import 'package:mobx/mobx.dart';
import '../gen/basic_knowledge.dart';
  
part 'knowledge.g.dart';

class Knowledge = _Knowledge with _$Knowledge;

abstract class _Knowledge extends BasicKnowledge with Store {
  _Knowledge(
      {required String title,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String id}) : super(title: title, createdAt: createdAt, updatedAt: updatedAt, id: id);

  // ignore: unused_element
  _Knowledge.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
