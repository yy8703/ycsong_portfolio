import 'package:equatable/equatable.dart';

class AnimationState extends Equatable {
  AnimationState({
    required this.animationFlag1,
    required this.animationFlag2,
  });

  final bool animationFlag1;
  final bool animationFlag2;

  AnimationState copyWith({
    bool? animationFlag1,
    bool? animationFlag2,
  }) {
    return AnimationState(
      animationFlag1: animationFlag1 ?? this.animationFlag1,
      animationFlag2: animationFlag2 ?? this.animationFlag2,
    );
  }

  @override
  List<Object> get props => [
        animationFlag1,
        animationFlag2,
      ];
}
