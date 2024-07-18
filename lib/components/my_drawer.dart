import 'package:flutter/material.dart';

import '../pages/settins.dart';

class my_drawer extends StatelessWidget {
  const my_drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(Icons.home_filled)
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('H O M E'),
              leading:  Icon(Icons.home_filled),
              onTap: ()=> Navigator.pop(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('S E T T I N G S'),
              leading:  Icon(Icons.home_filled),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>setins()));
              },
            ),
          )
        ],
      ),
    );
  }
}
