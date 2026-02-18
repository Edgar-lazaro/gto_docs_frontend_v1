import 'dart:convert';
import 'package:drift/drift.dart';

class GWqmPL1h92soN8 extends Table {
  IntColumn get f4 => integer().autoIncrement()();

  TextColumn get s5lJvd3 => text()();

  TextColumn get opiJZDaB0 => text()(); 
  // Para GLPI usamos un UUID local o timestamp

  TextColumn get dQ2fJw => text()(); // create, update, delete

  TextColumn get v3Dvw1i =>
      text().map(const CH4QcDZ8hi5WYcPfn8gxACzf()).nullable()();

  BoolColumn get tFiRWl5I4 =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get iGXSnoPMI =>
      dateTime().withDefault(currentDateAndTime)();
}

class CH4QcDZ8hi5WYcPfn8gxACzf
    extends TypeConverter<Map<String, dynamic>, String> {
  const CH4QcDZ8hi5WYcPfn8gxACzf();

  @override
  Map<String, dynamic> fromSql(String fromDb) =>
      jsonDecode(fromDb) as Map<String, dynamic>;

  @override
  String toSql(Map<String, dynamic> value) =>
      jsonEncode(value);
}