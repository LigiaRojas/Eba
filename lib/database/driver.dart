import 'dart:io';
import 'package:logger/logger.dart';
import 'package:eba/database/login.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:eba/database/credentials.dart' as Credentials;

class Driver {
  static final Driver _instance = Driver._privateConstructor();

  Db _database;

  Driver._privateConstructor();

  factory Driver() {
    return _instance;
  }

  Future<bool> openConnection() async {
    Logger().d('Opening connection to the database');
    try {
      _database = await Db.create(_buildConnectionUri());
    } on SocketException {
      Logger().d('Unable to connect to the internet. Connection to the database failed');
      return false;
    }
    Logger().d('Successfully connected to the internet. Waiting for connection to the database to be ready');
    await _database.open();
    Logger().d('Successfully connected to the database');
    return true;
  }

  Future<void> closeConnection() async {
    Logger().d('Closing connection to the database');
    await _database.close();
    Logger().d('Successfully closed the connection to the database');
  }

  Future<void> login(Login loginInfo) async {
    Logger().d('Saving the Login info to the database');
    if (_database == null || !_database.isConnected) {
      Logger().d('Currently not connected to the database. Trying to connect...');
      openConnection();
    }
    if (_database == null || !_database.isConnected) {
      Logger().d('Unable to connect to the database. Saving Login info locally');
      await FlutterSession().set('id', loginInfo);
    } else {
      var collection = _database.collection(Credentials.COLLECTION);
      var inserted = await collection.insertOne(loginInfo.toJson(), writeConcern: WriteConcern.ACKNOWLEDGED);
      Logger().d('Successfully saved the Login info to the database');
      var id = inserted['insertedId'].toHexString();
      await FlutterSession().set('id', id);
      Logger().d('Successfully saved the session ID locally');
      await closeConnection();
    }
  }

  String _buildConnectionUri() {
    String scheme = 'mongodb+srv';
    String authority = '${Credentials.USERNAME}:${Credentials.PASSWORD}@clustereba.dfkjm.mongodb.net';
    String path = '${Credentials.DATABASE}';
    String query = 'retryWrites=true&w=majority';
    return '$scheme://$authority/$path?$query';
  }
}