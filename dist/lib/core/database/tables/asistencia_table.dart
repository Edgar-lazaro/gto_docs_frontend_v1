import 'package:drift/drift.dart';

class UM32rkedXM4fJJA extends Table {
  // ID local autoincremental
  IntColumn get e8 => integer().autoIncrement()();

  // Usuario (AD / employeeId)
  TextColumn get uVjZenoVR => text()();

  // Fecha y hora exacta del registro
  DateTimeColumn get drqpLktq0 => dateTime()();

  // entrada | salida
  TextColumn get cnNH =>
      text().check(CustomExpression<bool>("tipo IN ('entrada', 'salida')"))();

  // manual | biometrico (futuro)
  TextColumn get a0DGLK => text().withDefault(const Constant('manual'))();

  // ¿ya se envió al backend?
  BoolColumn get on24yoYmhoDH => boolean().withDefault(const Constant(false))();

  // Auditoría
  DateTimeColumn get pxyTrSdf => dateTime().withDefault(currentDateAndTime)();
}
