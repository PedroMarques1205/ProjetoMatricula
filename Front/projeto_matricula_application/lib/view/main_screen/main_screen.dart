import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/infra/routes/router.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_state.dart';

//outras paginas
import '../professor/professor_page.dart';
import '../aluno/aluno_page.dart';
import '../secretaria/secretaria_page.dart';

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
        screen: FuncionalidadesScreen(),
      ),
      NavigationItem(
        label: 'Configs',
        icon: Icons.settings,
        selectedIcon: Icons.settings_suggest,
        screen: ConfigScreen(),
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
    // simulando dados 
    final String userName = "Lúcio Alves";
    final String userProfilePicture =
        "https://www.example.com/user_profile_picture.jpg"; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
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
                backgroundImage: NetworkImage(userProfilePicture),
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(height: 20),
              Text(
                "Nome: $userName",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _loginController,
                decoration: InputDecoration(
                  labelText: 'Login',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // logica para salvar ou atualizar informações
                  String updatedLogin = _loginController.text;
                  String updatedPassword = _passwordController.text;
                  // Aqui pode implementar a lógica para salvar os dados
                  // Exemplo: print("Login: $updatedLogin, Senha: $updatedPassword");
                },
                child: const Text('Atualizar Informações'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 92, 24, 33),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/pruminas.png',
            fit: BoxFit.cover,
            height: 200, 
          ),
          SizedBox(height: 20), 
          Text(
            'Atenção, Alunos da PRU MINAS!\n\n'
              'Não percam a oportunidade de garantir seu lugar neste semestre! É crucial que todos se matriculem em todas as disciplinas desejadas o quanto antes para não correr o risco de perder o semestre. A matrícula antecipada assegura sua vaga nas matérias e permite que você se organize melhor para os estudos.\n\n'
              'Não deixe para a última hora. Faça sua inscrição hoje mesmo e comece o semestre com o pé direito!\n\n'
              'Atenciosamente,\n'
              'Equipe PRU MINAS',
              textAlign: TextAlign.center, 
              style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black, 
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
                  MaterialPageRoute(builder: (context) => ProfessorPage()),
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