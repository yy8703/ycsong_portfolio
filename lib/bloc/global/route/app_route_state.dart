import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/data/types.dart';

class AppRouteState extends Equatable {
  const AppRouteState({
    this.processState,
  });

  final AppInitializerProcessState? processState;

  AppRouteState copyWith({
    AppInitializerProcessState? processState,
  }) {
    return AppRouteState(
      processState: processState ?? this.processState,
    );
  }

  @override
  List<Object?> get props => [
        processState,
      ];
}
