import 'package:path_provider/path_provider.dart';
import 'package:scedu/gen/meta.dart';
import 'package:scedu/store/root_store.dart';
import 'package:schema_util/schema_util.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

late Schema _schema;
late Database _db;

Future<void> initDatabase(Schema schema) async {
  final dir = await getApplicationDocumentsDirectory();

  _schema = schema;

  DatabaseFactory dbFactory = databaseFactoryIo;
  _db = await dbFactory.openDatabase(dir.path + "/scedU.db");

  rootStore.agendaStore.loadActivities();
}

Future<void> saveEntity(Entity entity) async {
  final type = entity.runtimeType.toString();

  final store = stringMapStoreFactory.store(type);
  await store.record(entity.id).add(_db, entity.toJson());
}

Future<Iterable<T>> loadEntities<T extends Entity>() {
  final type = T.toString();

  final model =
      _schema.root.allChildren.firstWhere((model) => model.name == type);

  final store = stringMapStoreFactory.store(type);

  return store.find(_db).then((entries) => entries.map<T?>(((entry) {
        final creator = creators[model.id];
        if (creator != null) {
          final entity = creator(entry.value);
          return entity as T;
        }
        return null;
      })).whereType<T>());
}
