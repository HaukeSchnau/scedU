import '../gen/basic_cortex.dart';
  
class Cortex extends BasicCortex {
  Cortex(
      {required String title,
      String? description,
      required String id}) : super(title: title, description: description, id: id);

  Cortex.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
