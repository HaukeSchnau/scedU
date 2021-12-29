import '../gen/basic_knowledge.dart';
  
class Knowledge extends BasicKnowledge {
  Knowledge(
      {required String title,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String id}) : super(title: title, createdAt: createdAt, updatedAt: updatedAt, id: id);

  Knowledge.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
