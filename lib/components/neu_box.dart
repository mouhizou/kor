

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../theme/theme_prov.dart';
class neu_box extends StatelessWidget {
  final Widget? child;
  const neu_box({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    bool isdarkmode = Provider.of<theme_prov>(context).isdarckmode;
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(15),
          boxShadow:[
            BoxShadow(
                color: isdarkmode ? Colors.black : Colors.grey.shade500,
                blurRadius: 15,
                offset: Offset(4,4)

            ),
            BoxShadow(
                color: isdarkmode ? Colors.grey.shade800 : Colors.white,
                blurRadius: 15,
                offset: Offset(-4,-4)

            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}
