import 'package:get/get.dart';
import 'package:my_contacts/db_contacts/contacts_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBContacts extends GetxService {
  late Database dbBase;

  Future<DBContacts> init() async {
    await createContactsDB();
    return this;
  }

  createContactsDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'contacts.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createContactsTable(db);
    });
  }

  createContactsTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS contacts (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, name TEXT, gender INTEGER, image BLOB, birth TEXT)');
  }

  insertContacts(ContactsEntity entity) async {
    final id = await dbBase.insert('contacts', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'name': entity.name,
      'gender': entity.gender,
      'image': entity.image,
      'birth': entity.birth.toIso8601String()
    });
    return id;
  }

  cleanContactsData() async {
    await dbBase.delete('contacts');
  }

  Future<List<ContactsEntity>> getContactsAllData() async {
    var result = await dbBase.query('contacts', orderBy: 'createdTime DESC');
    return result.map((e) => ContactsEntity.fromJson(e)).toList();
  }
}
