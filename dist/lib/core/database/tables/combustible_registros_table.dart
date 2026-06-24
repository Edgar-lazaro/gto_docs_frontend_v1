import 'package:drift/drift.dart';

class CombustibleRegistrosTable extends Table {
  TextColumn get id => text()();
  TextColumn get usuarioId => text()();

  /// usar_vehiculo | cargar_combustible
  TextColumn get modo => text()();

  // Campos modo: usar_vehiculo
  TextColumn get nombre => text().nullable()();
  TextColumn get destino => text().nullable()();
  TextColumn get horaInicio => text().nullable()();
  TextColumn get horaFinal => text().nullable()();
  TextColumn get combustibleInicial => text().nullable()();
  IntColumn get kilometrajeInicial => integer().nullable()();
  TextColumn get combustibleFinal => text().nullable()();
  IntColumn get kilometrajeFinal => integer().nullable()();

  // Campos modo: cargar_combustible
  TextColumn get fechaCarga => text().nullable()();
  TextColumn get operador => text().nullable()();
  IntColumn get kmAntes => integer().nullable()();
  IntColumn get kmDespues => integer().nullable()();

  /// JSON libre (ej. rutas locales de fotos)
  TextColumn get metadata => text().nullable()();

  /// Último error de sincronización (para diagnóstico en UI)
  TextColumn get syncError => text().nullable()();

  /// Última respuesta/resultado de sincronización (para auditoría/diagnóstico)
  TextColumn get syncInfo => text().nullable()();

  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
  DateTimeColumn get creadoEn => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
