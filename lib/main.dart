import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'enums/connectivity_status.dart';
import 'services/connectivity.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      create: (context) {
        return ConnectivityService().connectionStatusController.stream;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          textTheme: GoogleFonts.robotoCondensedTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConnectivityStatus connectivity = Provider.of<ConnectivityStatus>(context);

    return Scaffold(
      body: Center(
        child: Text(
          '${connectivity.toString()}',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}
