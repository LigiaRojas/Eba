import 'package:mongo_dart/mongo_dart.dart';
import 'package:eba/database/credentials.dart' as Credentials;

class Driver {
  static final Driver _instance = Driver._privateConstructor();
  Db _database;

  Driver._privateConstructor();

  factory Driver() {
    return _instance;
  }

  Future<void> openConnection() async {
    _database = await Db.create(_buildConnectionUri());
    await _database.open();
  }

  Future<void> closeConnection() async {
    _database.close();
  }

  Future<String> login(Map<String, dynamic> values) async {
    var collection = _database.collection(Credentials.COLLECTION);
    var inserted = await collection.insertOne(values, writeConcern: WriteConcern.ACKNOWLEDGED);
    return inserted['insertedId'].toHexString();
  }

  String _buildConnectionUri() {
    String scheme = 'mongodb+srv';
    String authority = '${Credentials.USERNAME}:${Credentials.PASSWORD}@clustereba.dfkjm.mongodb.net';
    String path = '${Credentials.DATABASE}';
    String query = 'retryWrites=true&w=majority';
    return '$scheme://$authority/$path?$query';
  }
}