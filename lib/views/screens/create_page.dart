import 'package:brasil_fields/brasil_fields.dart';
import 'package:contatos_app/models/contato_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreatePage extends StatefulWidget {
  final Contato contato;
  const CreatePage(this.contato, {super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController ufController = TextEditingController();
  TextEditingController dataDeNascimentoController = TextEditingController();
  bool favorito = false;
  final List<String> listUF = [
    "Selecione um UF",
    "AC",
    "AL",
    "AP",
    "BA",
    "CE",
    "DF",
    "ES",
    "GO",
    "MA",
    "MT",
    "MS",
    "MG",
    "PR",
    "PB",
    "PE",
    "PI",
    "RJ",
    "RN",
    "RS",
    "RO",
    "RR",
    "SC",
    "SE",
    "SP",
    "TO",
  ];

  @override
  void initState() {
    if (widget.contato != Contato.vazio()) {
      carregarDados();
    }
    super.initState();
  }

  void carregarDados() {
    nomeController.text = widget.contato.nome;
    setState(() {});
  }

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
        child: ListView(
          children: [
            Container(
              color: Colors.blueAccent,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: const Center(
                  child: Icon(
                Icons.add,
                size: 80,
                color: Colors.white,
              )),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                        hintText: "Digite seu nome",
                        prefixIcon: Icon(Icons.person)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: telefoneController,
                    onChanged: (value) => print(value),
                    decoration: const InputDecoration(
                        hintText: "Digite seu telefone",
                        prefixIcon: Icon(Icons.phone)),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter()
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: dataDeNascimentoController,
                    onChanged: (value) => print(value),
                    decoration: const InputDecoration(
                        hintText: "Digite sua data de nascimento",
                        prefixIcon: Icon(Icons.calendar_month)),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DataInputFormatter()
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: emailController,
                    onChanged: (value) => print(value),
                    decoration: const InputDecoration(
                        hintText: "Digite seu email",
                        prefixIcon: Icon(FontAwesomeIcons.envelope)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: enderecoController,
                    onChanged: (value) => print(value),
                    decoration: const InputDecoration(
                        hintText: "Digite seu endereco",
                        prefixIcon: Icon(FontAwesomeIcons.locationDot)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: cidadeController,
                    onChanged: (value) => print(value),
                    decoration: const InputDecoration(
                    hintText: "Digite seu cidade",
                    prefixIcon: Icon(FontAwesomeIcons.mapLocationDot)),
                  ),
                  DropdownButton<String>(
                    hint: Text('UF'),
                    menuMaxHeight: MediaQuery.of(context).size.height * 0.3,
                    onChanged: (ufSelecionada) {
                  ufController.text = ufSelecionada!;
                  setState(() {});
                    },
                    items: listUF.map((String uf) {
                  return DropdownMenuItem(
                    value: uf,
                    child: Text(uf),
                  );
                    }).toList(),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
