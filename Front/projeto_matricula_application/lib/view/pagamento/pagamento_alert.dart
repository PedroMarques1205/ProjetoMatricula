import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/view/main_screen/main_screen.dart';

class PagamentoAlert extends StatefulWidget {
  @override
  _PagamentoAlertState createState() => _PagamentoAlertState();
}

class _PagamentoAlertState extends State<PagamentoAlert> {
  Map<String, bool> paymentStatus = {
    'Janeiro': false,
    'Fevereiro': false,
    'Março': false,
    'Abril': false,
    'Maio': false,
    'Junho': false,
    'Julho': false,
    'Agosto': false,
    'Setembro': false,
    'Outubro': false,
    'Novembro': false,
    'Dezembro': false,
  };

  void markAsPaid(String month) {
    setState(() {
      paymentStatus[month] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[600],
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Emissão do Boleto Bancário',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600]),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ProjectColors.primaryLight),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: paymentStatus.keys.map((month) {
            bool isPaid = paymentStatus[month]!;
            DateTime dueDate = DateTime(
                2024, paymentStatus.keys.toList().indexOf(month) + 1, 1);
            return Card(
              color: ProjectColors.buttonColor,
              elevation: 5,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Theme(
                data: ThemeData(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  leading: Icon(Icons.file_copy, color: Colors.grey[800]),
                  title: Text(
                    '${month}/2024',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  trailing: Icon(
                    isPaid ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: isPaid ? Colors.green : Colors.red,
                  ),
                  children: [
                    if (!isPaid)
                      ListTile(
                        title: const Text(
                          'Confirmar pagamento',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () => markAsPaid(month),
                      ),
                    if (isPaid)
                      const ListTile(
                        title: Text(
                          'Pago',
                          style: TextStyle(color: Colors.green),
                        ),
                        leading: Icon(Icons.check_circle, color: Colors.green),
                      ),
                    ListTile(
                      title: Text(
                        'Vencimento: ${dueDate.toLocal().toString().split(' ')[0]}',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Pagador: Aluno',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
