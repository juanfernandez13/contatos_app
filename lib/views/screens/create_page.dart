import 'package:contatos_app/models/contato_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CreatePage extends StatefulWidget {
  final Contato contato;
  const CreatePage(this.contato, {super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(widget.contato == Contato.vazio()
            ? "Criar cadastro"
            : "Editar cadastro"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              color: Colors.blueAccent,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: const Center(child: Icon(Icons.add, size: 80, color: Colors.white,)),
            ),
            
          ],
        ),
      ),
    ));
  }
}
