part of 'user_dashboard_cubit.dart';

@immutable
sealed class UserDashboardState {
  const UserDashboardState();
}

final class UserDashboardInitial extends UserDashboardState {
  const UserDashboardInitial();
}

final class UserDashboardLoading extends UserDashboardState {
  const UserDashboardLoading();
}

final class UserDashboardSuccess extends UserDashboardState {
  const UserDashboardSuccess(this.dashboard);
  final DashboardEntity dashboard;
}

final class UserDashboardFailure extends UserDashboardState {
  const UserDashboardFailure();
}
