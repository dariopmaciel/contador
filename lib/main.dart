import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//---------------------------
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  void decrement() {
    setState(() {
      contador--;
    });
    print(contador);
  }

  void increment() {
    setState(() {
      contador++;
    });
    print(contador);
  }

  bool get isEmpty => contador == 0;
  bool get isFull => contador == 20;
  bool get zero => contador == 0;

  @override
  Widget build(BuildContext context) {
    //print("Build"); //metodo responsavel por construir a tela
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/imagens/paes.jpeg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? "LOTADO" : "PODE ENTRAR!",
              style: TextStyle(
                fontSize: 30,
                color: isFull
                    ? Colors.red
                    : zero
                        ? Colors.blue
                        : Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: isFull ? 0 : 0,
              ),
            ),
            const SizedBox(height: 32), //box de divisão
            Text(
              //"0",
              contador.toString(),
              style: TextStyle(
                fontSize: 100,
                color: isFull
                    ? Colors.red
                    : zero
                        ? Colors.blue
                        : Colors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(125, 125),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: isEmpty
                            ? Colors.red.withOpacity(0.5)
                            : Colors.transparent,
                        width: 5,
                      ),
                    ),
                  ),
                  child: const Text(
                    "SAIU",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(125, 125),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isFull
                            ? Colors.red.withOpacity(0.5)
                            : Colors.transparent,
                        width: 5,
                      ),
                    ),
                  ),
                  child: const Text(
                    "ENTROU",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
