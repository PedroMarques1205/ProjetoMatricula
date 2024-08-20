import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:projeto_matricula_application/view/main_screen/widgets/main_side_bar.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

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

              final destinations = allowedDestinations
                  .map((e) => NavigationDestination(
                      icon: Icon(e.icon!),
                      selectedIcon: Icon(e.selectedIcon),
                      label: e.label!))
                  .toList();

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
                              WidgetStateProperty.resolveWith<TextStyle>(
                            (Set<WidgetState> states) =>
                                states.contains(WidgetState.selected)
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

class NavDestinationModel {
  List<NavigationItem> getDestinations() {
    return [
      NavigationItem(
        label: 'Home',
        icon: Icons.home,
        selectedIcon: Icons.home_filled,
        screen: HomeScreen(),
      ),
      NavigationItem(
        label: 'Funcionalidades',
        icon: Icons.build,
        selectedIcon: Icons.build_circle,
        screen: const FuncionalidadesScreen(),
      ),
      NavigationItem(
        label: 'Configs',
        icon: Icons.settings,
        selectedIcon: Icons.settings_suggest,
        screen: const ConfigScreen(),
      ),
    ];
  }
}

class NavigationItem {
  final String? label;
  final IconData? icon;
  final IconData? selectedIcon;
  final Widget screen;

  NavigationItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.screen,
  });
}

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializando com valores de exemplo
    _loginController.text = "lucio.alves";
    _passwordController.text = "********";
  }

  @override
  Widget build(BuildContext context) {
    // Simulando dados do usuário
    const String userName = "Lúcio Alves";
    const String userProfilePicture =
        "https://www.example.com/user_profile_picture.jpg"; // URL da foto de perfil

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: const NetworkImage(userProfilePicture),
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(height: 20),
              const Text(
                "Nome: $userName",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _loginController,
                decoration: const InputDecoration(
                  labelText: 'Login',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  String updatedLogin = _loginController.text;
                  String updatedPassword = _passwordController.text;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Atualizar Informações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: const HeroIcon(HeroIcons.bars3, color: Colors.blue),
          ),
        ),
        drawer: const DrawerWidget(),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                'Bem-vinda, Juliana!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 25),
              ),
              Text(
                'Um subtítulo muito dahora para a sua home.',
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}

class FuncionalidadesScreen extends StatelessWidget {
  const FuncionalidadesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Funcionalidades',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
