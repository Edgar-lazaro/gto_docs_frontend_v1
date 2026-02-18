import 'package:drift/drift.dart';

class BHXr3H0gu6FNldMHfq extends Table {
  TextColumn get yE => text()();
  TextColumn get sDKp7v => text()();
  TextColumn get b54gA0B => text()();
  TextColumn get wrKy =>
      text().withDefault(const Constant('info'))(); // info | alerta | critica
  BoolColumn get puyxl =>
      boolean().withDefault(const Constant(false))();
  TextColumn get imrA2q =>
      text().nullable()(); // asistencia, glpi, inventarios
  DateTimeColumn get rLq1z =>
      dateTime().withDefault(currentDateAndTime)();
}