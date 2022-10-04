import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'game_store.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetails extends StatefulWidget {
  final int idx;
  const GameDetails({Key? key, required this.idx}) : super(key: key);

  @override
  State<GameDetails> createState() => _GameDetailsState();
}

class _GameDetailsState extends State<GameDetails> {
  bool click = true;

  void _launchURL(_url) async {
    if(!await launch(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final GameStore games = gameList[widget.idx];
    return Scaffold(
      backgroundColor: (click == false) ? Colors.deepPurple[50] : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        title: Text(games.name),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  click = !click;
                });
              },
              icon: (click == false) ? Icon(Icons.favorite) : Icon(Icons.favorite_border),

          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(40, 0, 40, 40),
        children: [
          Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(games.name, style: TextStyle(fontSize: 25)),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                    Card(
                      color: Colors.deepPurple[100],
                      elevation: 10,
                      shadowColor: Colors.deepPurple[200],
                      child: ListTile(
                        title: Text('Images', textAlign: TextAlign.center,),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: 300,
                          child: _scrollImages(),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.deepPurple[100],
                      elevation: 10,
                      shadowColor: Colors.deepPurple[200],
                      child: ListTile(
                        title: Text('Description', textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      child: Text('About: ${games.about}', textAlign: TextAlign.center,),
                      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),

                    ),
                    Text('Release Date: : ${games.releaseDate}'),
                    Text('Price: ${games.price}'),
                    Text('Tags: '),
                    Text('#${games.tags[0]} #${games.tags[1]} #${games.tags[2]} #${games.tags[3]}'),
                    Text('Review Average: ${games.reviewAverage}'),
                    Text('Review Count: ${games.reviewCount}'),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: (){
                        _launchURL(games.linkStore);
                        },
                        child: Text('Go To Store'),
                      style: ElevatedButton.styleFrom(primary: Colors.deepPurple[100], onPrimary: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // Widget _tags(){
  //   GameStore list = gameList[widget.idx];
  //   return ListView.builder(itemBuilder:(context,index){
  //     return Card(
  //         child: Padding(
  //           padding: EdgeInsets.all(10),
  //           child: Text('# ${list.tags[index]}'),
  //         ),
  //     );
  //   });
  // }

  Widget _scrollImages() {
    GameStore list = gameList[widget.idx];
    return ListView.builder(
        itemBuilder: (context, index){
      return InkWell(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(list.imageUrls[index], height: 200, alignment: Alignment.center,),
              ],
            ),
          ),
        ),
      );
    },
    scrollDirection: Axis.horizontal,
    itemCount: list.imageUrls.length
    );
  }
}
