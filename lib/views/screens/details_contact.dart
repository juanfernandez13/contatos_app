import 'package:contatos_app/views/screens/create_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/contato_model.dart';

class DetailsContact extends StatelessWidget {
  final Contato contato;
  const DetailsContact(this.contato, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: floatingActionButtonFavorite(contato),
            appBar: AppBar(
              title: const Text("Detalhes"),
              actions: [
                IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CreatePage(contato))), icon: const FaIcon(FontAwesomeIcons.pencil))
              ],
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  contato.pathImg == ""
                      ? Container(
                          color: Colors.blueAccent,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Center(
                              child: Text(
                            contato.nome[0].toUpperCase(),
                            style: const TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                        )
                      : Image.network(
                          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                        ),

                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(contato.nome),
                    ),
                    ListTile(
                      leading: const Icon(Icons.calendar_month),
                      title: Text(contato.dataDeNascimento),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text(contato.telefone),
                    ),
                    ListTile(
                      leading: const FaIcon(FontAwesomeIcons.solidEnvelope),
                      title: Text(contato.email),
                    ),
                    ListTile(
                      leading: const FaIcon(FontAwesomeIcons.locationDot),
                      title: Text("${contato.endereco}, ${contato.cidade} - ${contato.uf}"),
                    ),

                ],
              ),
            )));
  }
}

class floatingActionButtonFavorite extends StatefulWidget {
  final Contato contato;
  const floatingActionButtonFavorite(this.contato, {super.key});

  @override
  State<floatingActionButtonFavorite> createState() => _floatingActionButtonFavoriteState();
}

class _floatingActionButtonFavoriteState extends State<floatingActionButtonFavorite> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: widget.contato.favorito? const Icon(Icons.star)
          : const Icon(Icons.star_border_outlined),
      onPressed: () => setState(() {
        widget.contato.favorito = !widget.contato.favorito;
      }));
  }
}
