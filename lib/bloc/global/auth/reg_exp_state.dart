import 'package:equatable/equatable.dart';

class RegExpState extends Equatable {
  const RegExpState({
    required this.errorText,
    required this.isEnabled,
    this.value,
  });

  final String errorText;

  final bool isEnabled;

  final String? value;

  @override
  List<Object?> get props => [
        errorText,
        isEnabled,
        value,
      ];
}
