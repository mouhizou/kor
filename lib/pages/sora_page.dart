import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../audio/audio_prov.dart';
import '../components/neu_box.dart';
import '../models/sora.dart';
class sora_page extends StatefulWidget {
  const sora_page({super.key});

  @override
  State<sora_page> createState() => _sora_pageState();
}

class _sora_pageState extends State<sora_page> {

  String formatTime(Duration duration){
    String towdigestSecns = duration.inSeconds.remainder(60).toString();
    if(duration.inMinutes <10){
      if(duration.inSeconds.remainder(60)<10){
        return ('0${duration.inMinutes}:0$towdigestSecns');
      }else{
        return ('0${duration.inMinutes}:$towdigestSecns');
      }
    }else{
      if(duration.inSeconds.remainder(60)<10){
        return ('${duration.inMinutes}:0$towdigestSecns');
      }else{
        return ('${duration.inMinutes}:$towdigestSecns');
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<audio_prov>(
        builder: (context,value,child){
          final  List <sora> playelist;
          final sora Sora;

          playelist = value.Soras;
          Sora=playelist[value.curentsoraindex ?? 0];

          return SafeArea(
              child:Scaffold(

                appBar: AppBar(
                  title: Text('S O R A  ${Sora.name}'),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //image
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: neu_box(
                        child: Column(
                          children: [
                            ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.asset(Sora.imagePath)),
                            //  name and heart butten
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(

                                    children: [
                                      Text(Sora.name),
                                      Text(Sora.name,style: TextStyle(fontSize: 10),)
                                    ],
                                  ),
                                  Icon(Icons.favorite,color: Colors.red,)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //time Strings
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatTime(value.getcurentduration)),
                          Text(formatTime(value.gettotalduration)),
                        ],
                      ),
                    ),

                    //progers line
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 0
                          )
                      ),
                      child: Slider(
                        min: 0,
                        max: value.gettotalduration.inSeconds.toDouble(),
                        activeColor: Colors.green,
                        value: value.getcurentduration.inSeconds.toDouble(),
                        onChanged: (double doubel){

                        },
                        onChangeEnd: (double dobel){
                          value.seek(Duration(seconds: dobel.toInt()));
                        },
                      ),
                    ),
                    //row of buttens
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: value.playprev,
                              child: neu_box(child: Icon(Icons.arrow_back,size: 40,))
                          ),
                          GestureDetector(
                              onTap: value.pauseorresume,
                              child: neu_box(child: Icon(value.isplaying? Icons.pause: Icons.play_arrow,size: 40,))
                          ),
                          GestureDetector(
                            onTap: value.playnest,
                            child: neu_box(child: Icon(Icons.arrow_forward,size: 40,)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
          );
        }
    );
  }
}
