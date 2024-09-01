import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/view/main_screen/widgets/main_drawer.dart';
import 'package:projeto_matricula_application/view/user_subjects/user_subjects.dart';
import 'package:projeto_matricula_application/view/users_grade_page/users_grade_page.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_state.dart';

//outras paginas
import '../professor/professor_page.dart';
import '../aluno/aluno_page.dart';
import '../secretaria/secretaria_page.dart';

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
                      icon: HeroIcon(e.heroIcon!),
                      selectedIcon: HeroIcon(e.heroIcon!),
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
        heroIcon: HeroIcons.home,
        selectedIcon: HeroIcons.home,
        screen: HomeScreen(),
      ),
      if (Context.currentUser.tipoAcesso == UserTypeEnum.Aluno)
        NavigationItem(
          label: 'Currículo',
          heroIcon: HeroIcons.rectangleStack,
          selectedIcon: HeroIcons.rectangleStack,
          screen: UsersGradePage(),
        ),
      NavigationItem(
        label: 'Configs',
        heroIcon: HeroIcons.cog6Tooth,
        selectedIcon: HeroIcons.cog6Tooth,
        screen: const ConfigScreen(),
      ),
    ];
  }
}

class NavigationItem {
  final String? label;
  final HeroIcons? heroIcon;
  final HeroIcons? selectedIcon;
  final Widget screen;

  NavigationItem({
    required this.label,
    required this.selectedIcon,
    required this.screen,
    this.heroIcon,
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
    //iniciando valores
    _loginController.text = "lucio.alves";
    _passwordController.text = "********";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(
              'Configurações',
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.white),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[400],
                    child: const HeroIcon(
                      size: 40,
                      HeroIcons.user,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Context.currentUser.nome!,
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          Context.currentUser.tipoAcesso!.name,
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: IconButton(
                      icon: HeroIcon(
                        HeroIcons.pencilSquare,
                        color: Colors.grey[500],
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const HeroIcon(
                    HeroIcons.phone,
                    color: ProjectColors.primaryLight,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Fale Conosco',
                    style: TextStyle(color: Colors.grey[500], fontSize: 18),
                  ),
                  const Spacer(),
                  HeroIcon(
                    HeroIcons.chevronRight,
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const HeroIcon(
                    HeroIcons.identification,
                    color: ProjectColors.primaryLight,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Carteirinha virtual',
                    style: TextStyle(color: Colors.grey[500], fontSize: 18),
                  ),
                  const Spacer(),
                  HeroIcon(
                    HeroIcons.chevronRight,
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const HeroIcon(
                    HeroIcons.arrowTopRightOnSquare,
                    color: ProjectColors.primaryLight,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sair',
                    style: TextStyle(color: Colors.grey[500], fontSize: 18),
                  ),
                  const Spacer(),
                  HeroIcon(
                    HeroIcons.chevronRight,
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
            const Divider()
          ]),
        ));
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: AppBar(
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: const HeroIcon(HeroIcons.bars3,
                color: ProjectColors.primaryColor),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const HeroIcon(
                  HeroIcons.bell,
                  color: ProjectColors.primaryLight,
                  size: 25,
                ))
          ],
        ),
        drawer: const DrawerWidget(),
        body: _loadContent());
  }

  Widget _loadContent() {
    switch (Context.currentUser.tipoAcesso) {
      case UserTypeEnum.Aluno:
        return _buildStudentsSubjects();
      case UserTypeEnum.Professor:
        return _buildTeatchersClasses();
      case UserTypeEnum.Secretaria:
        return _buildSecretaryContent();
      case null:
        return Center(
          child: Text(
            'Erro no carregamento. Faça o login novamente.',
            style:
                TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
          ),
        );
    }
  }

  Widget _buildStudentsSubjects() {
    return UserSubjects();
  }

  Widget _buildTeatchersClasses() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'Bem-vindo(a), Professor(a) ',
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey[700],
              ),
              children: [
                TextSpan(
                  text: Context.current.nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: '!',
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/pruMinasSymbol.png',
                width: 300,
                height: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecretaryContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'Bem-vindo(a), ',
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey[700],
              ),
              children: [
                TextSpan(
                  text: Context.current.nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: '!',
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/pruMinasSymbol.png',
                width: 300,
                height: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FuncionalidadesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionalidades'),
        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCustomButton(
              context: context,
              label: 'Ir para Professor',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClassProfessorPage()),
                );
              },
            ),
            const SizedBox(height: 16.0),
            _buildCustomButton(
              context: context,
              label: 'Ir para Secretaria',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecretariaPage()),
                );
              },
            ),
            const SizedBox(height: 16.0),
            _buildCustomButton(
              context: context,
              label: 'Ir para Aluno',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlunoPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        backgroundColor: const Color.fromARGB(255, 92, 24, 33),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      child: Center(child: Text(label)),
    );
  }
}
