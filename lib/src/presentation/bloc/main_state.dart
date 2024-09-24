import 'package:equatable/equatable.dart';
import 'package:kdigital_test/src/data/models/character.dart';
import 'package:kdigital_test/src/enums/enum.dart';

class MainPageState extends Equatable {
  final List<Character>? characters;
  final LogicStatus logicStatus;
  MainPageState({
    this.characters,
    this.logicStatus = LogicStatus.init,
  });

  MainPageState copyWith({
    List<Character>? characters,
    LogicStatus? logicStatus,
  }) {
    return MainPageState(
      logicStatus: logicStatus ?? this.logicStatus,
      characters: characters ?? this.characters,
    );
  }

  static MainPageState initial() => MainPageState();

  @override
  List<Object?> get props => [characters, logicStatus];
}
