import 'package:contatos_app/views/screens/details_contact.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/contato_model.dart';

class ListTileContato extends StatefulWidget {
  final Contato contato;
  ListTileContato(this.contato ,{super.key});

  @override
  State<ListTileContato> createState() => _ListTileContatoState();
}

class _ListTileContatoState extends State<ListTileContato> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsContact(widget.contato))),
      tileColor: Colors.grey,
      leading: widget.contato.pathImg == ""? 
      CircleAvatar(child: Center(child: Text(widget.contato.nome[0].toUpperCase()))) : 
      const CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(widget.contato.nome), Text(widget.contato.telefone)],
      ),
      trailing: IconButton(onPressed: () => setState(() => widget.contato.favorito = !widget.contato.favorito), icon: widget.contato.favorito
          ? const Icon(Icons.star)
          : const Icon(Icons.star_border_outlined))
    );
  }
}
