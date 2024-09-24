import 'package:kdigital_test/src/enums/enum.dart';
import 'package:kdigital_test/src/presentation/bloc/main_bloc.dart';
import 'package:kdigital_test/src/presentation/bloc/main_event.dart';
import 'package:kdigital_test/src/presentation/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/presentation/widgets/button_widget.dart';
import 'package:kdigital_test/src/presentation/widgets/character_widget.dart';
import 'package:kdigital_test/src/presentation/widgets/error_widget.dart';
import 'package:kdigital_test/src/presentation/widgets/loader_widget.dart';

@immutable
class CharactersScreen extends StatefulWidget {
  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainPageBloc, MainPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.logicStatus == LogicStatus.loading) {
          return LoaderWidget();
        } else if (state.logicStatus == LogicStatus.error) {
          return ErrorScreen(
            onTap: () {
              context.read<MainPageBloc>().add(CharacterListLoad(1));
            },
          );
        } else if (state.logicStatus == LogicStatus.success) {
          return Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      if (currentPage > 1) {
                        currentPage--;
                        context.read<MainPageBloc>().add(
                              CharacterListLoad(currentPage),
                            );
                      }
                    },
                  ),
                  Text(
                    "$currentPage",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ButtonWidget(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      currentPage++;
                      context.read<MainPageBloc>().add(
                            CharacterListLoad(currentPage),
                          );
                    },
                  )
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top: 16),
              child: ListView.builder(
                itemCount: state.characters?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, bottom: 16),
                    child: CharacterWidget(
                      character: state.characters![index],
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
