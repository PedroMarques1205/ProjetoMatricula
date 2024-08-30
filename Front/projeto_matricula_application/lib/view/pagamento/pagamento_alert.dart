import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/view/main_screen/main_screen.dart';

class PagamentoAlert extends StatefulWidget {
  @override
  _PagamentoAlertState createState() => _PagamentoAlertState();
}

class _PagamentoAlertState extends State<PagamentoAlert> {
  Map<String, bool> paymentStatus = {
    'January': false,
    'February': false,
    'March': false,
    'April': false,
    'May': false,
    'June': false,
    'July': false,
    'August': false,
    'September': false,
    'October': false,
    'November': false,
    'December': false,
  };

  void togglePaymentStatus(String month) {
    setState(() {
      paymentStatus[month] = !paymentStatus[month]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Pagamento Mensalidade',
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ProjectColors.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: paymentStatus.keys.map((month) {
                  return GestureDetector(
                    onTap: () => togglePaymentStatus(month),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: paymentStatus[month]! ? Colors.green : Colors.red,
                          width: 2.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          month,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
