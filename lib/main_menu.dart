import 'package:flutter/material.dart';
import 'package:prak_kuis_124200056/game_store.dart';
import 'package:prak_kuis_124200056/game_details.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        title: Text('Daftar Menu Game'),
      ),
      body: ListView.builder(
          padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
          itemBuilder: (context, index){
            final GameStore list = gameList[index];
            return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                        color: Colors.deepPurple
                    ),
                ),
              child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return GameDetails(idx: index,);
                }));
              },
              splashColor: Colors.deepPurple[200],
              hoverColor: Colors.deepPurple[50],
              child: Container(
                padding: EdgeInsets.all(20),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(list.imageUrls[0], height: 100,),
                      Text(list.name, style: TextStyle(fontSize: 30),),
                      Text(list.price, style: TextStyle(fontSize: 20),)
                    ],
                  ),
                )
              ),
            );
          },
        itemCount: gameList.length,
      ),
    );
  }
}
