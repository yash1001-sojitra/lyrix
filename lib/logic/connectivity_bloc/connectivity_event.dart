part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectedEvent {}

class OnConnectedEvent extends ConnectedEvent {}

class OnNotConnectedEvent extends ConnectedEvent {}
