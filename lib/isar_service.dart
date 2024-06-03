import 'package:good_eats/models/menu.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> saveMenu(Menu newMenu) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.menus.putSync(newMenu));
  }

  Future<void> cleanDb() async {

}

Future<Isar> openDB() async {
  final dir = await getApplicationDocumentsDirectory();
  if (Isar.instanceNames.isEmpty) {
    return await Isar.open(
      [MenuSchema],
      inspector: true,
      directory: dir.path
    );
  }
  return Future.value(Isar.getInstance());
}


}

