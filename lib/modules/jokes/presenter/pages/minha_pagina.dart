import 'package:flutter/material.dart';

class MinhaPagina extends StatefulWidget {
  const MinhaPagina({super.key});

  @override
  State<MinhaPagina> createState() => _MinhaPaginaState();
}

class _MinhaPaginaState extends State<MinhaPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const MeuTitulo(
          value: 'Jokes',
          negrito: true,
          cor: true,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: const MeuTitulo(
              value: 'Meu título',
              negrito: true,
              cor: false,
            ),
            leading: const CircleAvatar(),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}

class MeuTitulo extends StatelessWidget {
  const MeuTitulo({
    super.key,
    required this.value,
    this.negrito = false,
    required this.cor,
  });

  final String value;
  final bool negrito;
  final bool cor;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: negrito
          ? TextStyle(
              color: cor ? Colors.amber : Colors.blue,
              fontWeight: FontWeight.bold,
            )
          : null,
    );
  }
}
