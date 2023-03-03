import 'package:flutter/material.dart';

import '../../models/contato_model.dart';


class DetailsContact extends StatelessWidget {
  final Contato contato;
  const DetailsContact(this.contato, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text(contato.nome),),
      body: Column(),));
  }
}