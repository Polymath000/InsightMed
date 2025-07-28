import '../constants/end_ponits.dart';
import '../services/database_service.dart';

sealed class DashboardRepo {
  Future<void> getDashboardData();
}

final class DashboardRepoImpl implements DashboardRepo {
  const DashboardRepoImpl(this._database);
  final DatabaseService _database;
  @override
  Future<void> getDashboardData() =>
      _database.getDocument(path: EndPoint.getDashboard, documentId: '');
}
