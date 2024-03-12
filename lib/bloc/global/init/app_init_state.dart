import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/data/types.dart';

class AppInitState extends Equatable {
  const AppInitState({
    this.processState,
  });

  final AppInitializerProcessState? processState;

  AppInitState copyWith({
    AppInitializerProcessState? processState,
  }) {
    return AppInitState(
      processState: processState ?? this.processState,
    );
  }

  @override
  List<Object?> get props => [
        processState,
      ];
}
