import '../gen/basic_abstract_event.dart';
import '../model/location.dart';
import '../model/cortex.dart';
  
class AbstractEvent extends BasicAbstractEvent {
  AbstractEvent(
      {required String name,
      String? description,
      Location? location,
      Cortex? category,
      required String id}) : super(name: name, description: description, location: location, category: category, id: id);

  AbstractEvent.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
