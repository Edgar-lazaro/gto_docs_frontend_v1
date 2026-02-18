import 'package:drift/drift.dart';

class YZ7NFdRNLi55WlgCwtz9jQS1x extends Table {
  TextColumn get gk => text()();
  TextColumn get tiYn2ZQTn => text()();

  /// usar_vehiculo | cargar_combustible
  TextColumn get nwRh => text()();

  // Campos modo: usar_vehiculo
  TextColumn get rvTp1k => text().nullable()();
  TextColumn get ibSL46C => text().nullable()();
  TextColumn get tKAxtrCrSx => text().nullable()();
  TextColumn get nBR4gMxYp => text().nullable()();
  TextColumn get qImoTGYqjpgId4hv3U => text().nullable()();
  IntColumn get vT1UTUakaf0Hh5yMFl => integer().nullable()();
  TextColumn get qHXXyAKSuljRSZLM => text().nullable()();
  IntColumn get ecu2KxdVs6r2c4EH => integer().nullable()();

  // Campos modo: cargar_combustible
  TextColumn get xqKqRbRs3j => text().nullable()();
  TextColumn get ksg4lu2i => text().nullable()();
  IntColumn get jmWoO2d => integer().nullable()();
  IntColumn get v5WPhpUDZ => integer().nullable()();

  /// JSON libre (ej. rutas locales de fotos)
  TextColumn get cR1KYb73 => text().nullable()();

  /// Último error de sincronización (para diagnóstico en UI)
  TextColumn get yTMaqAfWa => text().nullable()();

  /// Última respuesta/resultado de sincronización (para auditoría/diagnóstico)
  TextColumn get sUuRWLq2 => text().nullable()();

  BoolColumn get iq7FcXyZInWs => boolean().withDefault(const Constant(false))();
  DateTimeColumn get mxSPDo81 => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {gk};
}
