import '../../../../core/entities/ray_entity.dart' show RayEntity;
import '../../../notes/domain/entities/note_entity.dart' show NoteEntity;

final class DashboardEntity {
  const DashboardEntity({this.rays, this.notes});
  final List<RayEntity>? rays;
  final List<NoteEntity>? notes;
}
