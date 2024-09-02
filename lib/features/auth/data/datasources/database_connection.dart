import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> createConnection() async {
  final settings = ConnectionSettings(
    host: 'localhost', // or '127.0.0.1'
    port: 44782, // Default MySQL port
    user: 'root',
    password: '',
    db: 'swift_shop',
  );
  return await MySqlConnection.connect(settings);
}
