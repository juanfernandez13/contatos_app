import 'package:contatos_app/views/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController optionsController;

  @override
  void initState() {
    super.initState();
    optionsController = TabController(initialIndex: 1, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          onTap: (page) => optionsController.index = page,
          controller: optionsController,
          items: const [
            TabItem(icon: Icon(Icons.star), title: "Favoritos"),
            TabItem(icon: Icon(Icons.person), title: "Contatos"),
            TabItem(icon: Icon(Icons.people), title: "Grupos"),
          ]),
      appBar: AppBar(
        title: const Text("Contatos"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search)), IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: TabBarView(
          controller: optionsController,
          children: [
            Container(color: Colors.red, child:Column(
              children:[
                 ListTileContato("jurertggggggggggggggggg", "(85) 98571-4993", true, path: "this.path",),
                 ListTileContato("juan", "(85) 98571-4993", true),
                 ListTileContato("juan", "(85) 98571-4993", true),
                 ListTileContato("juan", "(85) 98571-4993", true),
                 ListTileContato("juan", "(85) 98571-4993", true),
                 ListTileContato("juan", "(85) 98571-4993", true),
              ],
            ),),
            Container(color: Colors.green,),
            Container(color: Colors.blue,),
          ],
        ),
      ),
    ));
  }
}
