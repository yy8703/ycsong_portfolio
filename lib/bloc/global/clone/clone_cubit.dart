import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/clone/clone_state.dart';
import 'package:flutter_my_portfolio/repository/clone_repository.dart';

class CloneCubit extends Cubit<CloneState> {
  CloneCubit({
    required this.cloneRepository,
  }) : super(CloneState());

  final CloneRepository cloneRepository;
}
