import '../gen/basic_activity.dart';
import '../model/knowledge.dart';
import '../model/location.dart';
import '../model/cortex.dart';
  
class Activity extends BasicActivity {
  Activity(
      {required DateTime plannedStart,
      required int plannedDuration,
      required bool flexible,
      DateTime? checkedIn,
      DateTime? checkedOut,
      int? satisfaction,
      Knowledge? log,
      required String name,
      String? description,
      Location? location,
      Cortex? category,
      required String id}) : super(plannedStart: plannedStart, plannedDuration: plannedDuration, flexible: flexible, checkedIn: checkedIn, checkedOut: checkedOut, satisfaction: satisfaction, log: log, name: name, description: description, location: location, category: category, id: id);

  Activity.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
