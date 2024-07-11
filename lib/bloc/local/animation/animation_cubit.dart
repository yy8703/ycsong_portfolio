import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/local/animation/animation_state.dart';
import 'package:flutter_my_portfolio/repository/animation_repository.dart';

class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit({
    required this.animationRepository,
  }) : super(AnimationState(
          animationFlag1: false,
          animationFlag2: false,
        ));

  final AnimationRepository animationRepository;

  Future<void> init() async {
    emit(state.copyWith(animationFlag1: true));
  }
}
