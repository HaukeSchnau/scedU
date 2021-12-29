import '../gen/basic_entity.dart';
  
class Entity extends BasicEntity {
  Entity(
      {required String id}) : super(id: id);

  Entity.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
