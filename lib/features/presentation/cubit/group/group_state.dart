part of 'group_cubit.dart';

abstract class GroupState extends Equatable {
  const GroupState();
}

class GroupInitial extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupLoading extends GroupState {
  @override
  List<Object> get props => [];
}
class GroupLoaded extends GroupState {

  final List<GroupEntity> groups;

  GroupLoaded({required this.groups});

  @override
  List<Object> get props => [groups];
}
class GroupFailure extends GroupState {
  @override
  List<Object> get props => [];
}


