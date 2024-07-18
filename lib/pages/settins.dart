import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_prov.dart';
class setins extends StatefulWidget {
  const setins({super.key});

  @override
  State<setins> createState() => _setinsState();
}

class _setinsState extends State<setins> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Text("S E T T I N G S"),
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(20)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('THEME',style: TextStyle(color: Theme.of(context).colorScheme.background),),

                      CupertinoSwitch(
                        value: Provider.of<theme_prov>(context, listen: false).isdarckmode,
                        onChanged: (value)=> Provider.of<theme_prov>(context,listen: false).toglethemes(),
                      )

                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
