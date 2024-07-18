
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

import '../models/sora.dart';

class audio_prov extends ChangeNotifier {
  // List of sora's
  List<sora> korane = [
    sora(
        Audiopathe: "1.wav",
        name: "AL-F a t i h a h",
        imagePath: 'assets/1.png'
    ),
    sora(
        Audiopathe: "2.wav",
        name: "AL-B a q a r a h",
        imagePath: 'assets/2.png'
    ),
    sora(
        Audiopathe: "003.wav",
        name: "AL-I m r a n",
        imagePath: 'assets/3.png'
    ),
  ];

  // Current sora index
  int? curentsora;

  // Getters
  List<sora> get Soras => korane;
  int? get curentsoraindex => curentsora;
  bool get ISplayin => isplaying;
  Duration get getcurentduration => _curentduration;
  Duration get gettotalduration => _totalduration;

  // Setters
  set Curentsoraidex(int? index) {
    curentsora = index;
    if (index != null) {
      playsora();
      notifyListeners();
    }
    notifyListeners();
  }

  // Audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Duration
  Duration _curentduration = Duration.zero;
  Duration _totalduration = Duration.zero;

  // Constructor
  audio_prov(BuildContext context) {
    Listentoduration();
  }

  // Initially not playing
  bool isplaying = false;

  // Play the sora
  void playsora () async {
    final String path = korane[curentsoraindex!].Audiopathe;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    isplaying = true;
    notifyListeners();
  }

  // Pause current sora
  void pause() async {
    await _audioPlayer.pause();
    isplaying = false;
    notifyListeners();
  }

  // Resume playing
  void resume() async {
    await _audioPlayer.resume();
    isplaying = true;
    notifyListeners();
  }

  // Pause or resume
  void pauseorresume() async {
    if (isplaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // Seek current position
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // Play next
  void playnest() async {
    if (curentsora != null) {
      if (curentsora != korane.length - 1) {
        Curentsoraidex = curentsora! + 1;
      } else {
        Curentsoraidex = 0;
      }
    }
  }

  // Play previous
  void playprev() async {
    if (_curentduration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (curentsora != null) {
        if (curentsora != 0) {
          Curentsoraidex = curentsora! - 1;
        } else {
          Curentsoraidex = korane.length - 1;
        }
      }
    }
  }

  // Listen to duration
  void Listentoduration() {
    // Listen to total duration
    _audioPlayer.onDurationChanged.listen((newduration) {
      _totalduration = newduration;
      notifyListeners();
    });

    // Listen to current duration
    _audioPlayer.onPositionChanged.listen((newposition) {
      _curentduration = newposition;
      notifyListeners();
    });

    // Listen for sora completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playnest();
    });
  }
}

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../models/sora.dart';
//
// class audio_prov extends ChangeNotifier{
//   //list of sora's
//   final List <sora> korane =[
//     sora(
//         Audiopathe: "1.mp3"
//         , name: "AL-F A T I H A",
//         imagePath: 'lib/data/1.jpeg'
//     ),
//
//     sora(
//         Audiopathe: "1.mp3"
//         , name: "al fati7a(1)",
//         imagePath: '/'
//     ),
//
//     sora(
//         Audiopathe: "1.mp3"
//         , name: "al fati7a(2)",
//         imagePath: '/'
//     ),
//   ];
// //curent sora index
//   int? curentsora;
//
//   // G E T R S
//   List <sora>get Soras => korane;
//
//   int? get curentsoraindex => curentsora;
//
//   bool get ISplayin => isplaying;
//   Duration get getcurentduration => _curentduration;
//   Duration get gettotalduration => _totalduration;
//
//
//   // S E T E R S
// set Curentsoraidex(int? index){
//   curentsora=index;
//   if(index != null){
//     playsora();
//
//     notifyListeners();
//   }
//   notifyListeners();
// }
//
// /*
//
// AUDIO PLAYER
//
// */
//
//
// //audio player
// final AudioPlayer _audioPlayer = AudioPlayer();
//
// //duratio
// Duration _curentduration = Duration.zero;
// Duration _totalduration = Duration.zero;
//
// //constructer
// PlaylistProvider(){
//   Listentoduration();
// }
//
// //initialy not playing
// bool isplaying = false;
// //play the sora
// void playsora ()async{
//
//   final String path = korane[curentsoraindex!].Audiopathe;
//   //await _audioPlayer.stop();
//   await _audioPlayer.play(AssetSource(path));
//   isplaying = true;
//   notifyListeners();
//
// }
// //puase curent sora
// void pause()async{
//   await _audioPlayer.pause();
//   isplaying = false;
//   notifyListeners();
// }
// //resume playing
//   void resume() async{
//   await _audioPlayer.resume();
//   isplaying = true;
//   notifyListeners();
//   }
//
// //puse or resume
//   void pauseorresume() async{
//   if(isplaying){
//     pause();
//   }else{
//     resume();
//   }
//   notifyListeners();
//   }
//
// //seek cernt posintion
// void seek(Duration position) async{
//   await _audioPlayer.seek(position);
// }
// //playe next
// void playnest()async{
//   if(curentsora != null){
//     if(curentsora != korane.length-1){
//       Curentsoraidex = curentsora! +1;
//     }else{
//       Curentsoraidex=0;
//     }
//   }
// }
// //play previus
// void playprev()async{
//   if(_curentduration.inSeconds > 2){
//     seek(Duration.zero);
//   }else{
//     if(curentsora != null){
//       if(curentsora != 0){
//         Curentsoraidex = curentsora! -1;
//       }else{
//         Curentsoraidex=korane.length-1;
//       }
//     }
//   }
// }
// //list to duration
// void Listentoduration(){
//   //listen to total duration
//   _audioPlayer.onDurationChanged.listen((newduration) {
//     _totalduration = newduration;
//     notifyListeners();
//   });
//   //listen to curent duration
//   _audioPlayer.onPositionChanged.listen((newposition) {
//     _curentduration = newposition;
//     notifyListeners();
//   });
//   //listen for sora complition
//   _audioPlayer.onPlayerComplete.listen((event) { playnest();});
// }
//
// //dispose audioplayer
//
//
// }