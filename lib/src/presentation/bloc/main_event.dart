import 'package:equatable/equatable.dart';

abstract class MainPageEvent extends Equatable {
  const MainPageEvent();

  @override
  List<Object?> get props => [];
}

class CharacterListLoad extends MainPageEvent {
  final int page;

  const CharacterListLoad(this.page);

  @override
  List<Object?> get props => [];
}
