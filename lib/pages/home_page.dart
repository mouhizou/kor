import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:korane/pages/sora_page.dart';

import 'package:provider/provider.dart';

import '../audio/audio_prov.dart';
import '../components/my_drawer.dart';
import '../components/neu_box.dart';
import '../models/sora.dart';


class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late final dynamic playlistprovider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    playlistprovider = Provider.of<audio_prov>(context,listen: false);
  }
  void gotosora(int index){
    playlistprovider.Curentsoraidex = index;
    Navigator.push(context, MaterialPageRoute(builder: (context) => sora_page()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('K O R A N'),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            drawer: my_drawer(),
            body: Consumer<audio_prov>(
                builder: (context,value,childe){
                  List <sora> playlist = value.Soras;
                  return ListView.builder(
                      itemCount: playlist.length,
                      itemBuilder: (context,index){
                        final sora _sora=playlist[index];
                        return neu_box(
                            child: ListTile(
                              title: Text(_sora.name),
                              subtitle: Text(_sora.name),
                              leading: Image.asset(_sora.imagePath),
                              onTap: ()=>gotosora(index),
                            )
                        );
                      }
                  );
                }
            )
        )
    );
  }
}
