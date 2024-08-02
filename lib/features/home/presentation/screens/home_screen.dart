import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/flavors.dart';
import 'package:flutter_boilerplate/utils/env.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hello ${t!.appTitle}'),
            Text('Env =  ${Env.env}'),
          ],
        ),
      ),
    );
  }
}

// Scaffold(
//   appBar: AppBar(
//     title: Text(F.title),
//   ),
//   body: Center(
//     child: Text(
//       'Hello ${F.title}',
//     ),
//   ),
// );
