import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/infra/routes/router.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenWidgetState();
}

class MainScreenWidgetState extends State<MainScreen> {
  late NavDestinationModel nav;
  late MainScreenBloc bloc;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    nav = NavDestinationModel();
    bloc = MainScreenBloc();
  }

  @override
  Widget build(BuildContext context) {
    void onSelected(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    return LayoutBuilder(
      builder: (context, dimens) {
        return BlocBuilder<MainScreenBloc, MainScreenState>(
            bloc: bloc,
            builder: (BuildContext context, state) {
          final allowedDestinations = nav.getDestinations();

          final destinations = allowedDestinations.map((e) => NavigationDestination(icon: e.icon!, selectedIcon: e.selectedIcon, label: e.label!)).toList();

          return Scaffold(
            body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: allowedDestinations.isNotEmpty
                  ? allowedDestinations[currentIndex].screen
                  : null,
            ),
            bottomNavigationBar: allowedDestinations.isEmpty
                ? Container()
                : NavigationBarTheme(
                    data: NavigationBarThemeData(
                      labelTextStyle:
                          MaterialStateProperty.resolveWith<TextStyle>(
                        (Set<MaterialState> states) =>
                            states.contains(MaterialState.selected)
                                ? const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600)
                                : const TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w600),
                      ),
                    ),
                    child: PreferredSize(
                      preferredSize: const Size.fromHeight(61),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Divider(height: 1, color: Colors.grey[300]),
                          NavigationBar(
                            height: 60,
                            indicatorColor: Colors.purple.withOpacity(0),
                            surfaceTintColor: Colors.grey[100],
                            backgroundColor: Colors.grey[100],
                            destinations: destinations,
                            selectedIndex: currentIndex,
                            onDestinationSelected: onSelected,
                          )
                        ],
                      ),
                    ),
                  ),
          );
        });
      },
    );
  }
}
