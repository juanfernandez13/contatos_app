import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListTileContato extends StatefulWidget {
  final String? path;
  final String nome;
  final String telefone;
  bool favorito;
  ListTileContato(this.nome, this.telefone, this.favorito,{super.key, this.path});

  @override
  State<ListTileContato> createState() => _ListTileContatoState();
}

class _ListTileContatoState extends State<ListTileContato> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey,
      leading: widget.path == null ? 
      CircleAvatar(child: Center(child: Text(widget.nome[0].toUpperCase()))) : 
      const CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(widget.nome), Text(widget.telefone)],
      ),
      trailing: IconButton(onPressed: () => setState(() => widget.favorito = !widget.favorito), icon: widget.favorito
          ? const Icon(Icons.star)
          : const Icon(Icons.star_border_outlined))
    );
  }
}
