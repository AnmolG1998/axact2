import 'package:axact2/models/pixabay.dart';
import 'package:axact2/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:axact2/services/api_manager.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Welcome> welcomeModel;

  @override
  void initState(){
    welcomeModel = API_Manager().getVideos();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Axact'),
      ),
      body: Container(
        child: FutureBuilder<Welcome>(
          future: welcomeModel,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.total,
                  itemBuilder: (context,index){
                    var hit=snapshot.data.totalHits;
                return Container(
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      Image.network('https://cdn.pixabay.com/user/2019/11/12/18-53-20-554_250x250.jpg'),
                      Image.network('https://cdn.pixabay.com/user/2016/01/05/06-31-48-75_250x250.jpg'),
                      Image.network('https://cdn.pixabay.com/user/2020/09/01/16-02-54-490_250x250.jpg')
                     

                    ],
                  ),
                );
              });
            }else
              return Center(child: CircularProgressIndicator());

          },
        ),
      ),
    );
  }
}
