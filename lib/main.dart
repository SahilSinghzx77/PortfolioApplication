import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animatable<Color> background = TweenSequence<Color>(
    [
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.red,
          end: Colors.orange,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.orange,
          end: Colors.amber,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.amber,
          end: Colors.green,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.green,
          end: Colors.blue,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.blue,
          end: Colors.purple,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.purple,
          end: Colors.pink,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.pink,
          end: Colors.red,
        ),
      ),
    ],
  );
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            backgroundColor:
            background.evaluate(AlwaysStoppedAnimation(_controller.value)),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: 150,
                            child: FlareActor("animations/dpbg.flr",
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                animation: "Alarm"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(21.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              elevation: 0,
                              child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage('https://media-exp1.licdn.com/dms/image/C5103AQH1nGUXWa9xZw/profile-displayphoto-shrink_400_400/0/1576965717953?e=1633564800&v=beta&t=aAAVXAtx1DucrNE2_3Lk5Pfi-HrDgfv-yi7I-RF4a24')
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: Text(
                          'Sahil Singh',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 175,
                        child: Divider(
                          color: Colors.white54,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: _launchPhone,
                        child: Tooltip(
                          message: 'Phone',
                          waitDuration: Duration(milliseconds: 500),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                    size: 23,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13),
                                    child: Text(
                                      '   +91 6202099733',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),),
                      GestureDetector(
                        onTap: _launchURL,
                        child: Tooltip(
                          message: 'Email',
                          waitDuration: Duration(milliseconds: 500),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.mail,
                                    color: Colors.white,
                                    size: 23,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13),
                                    child: Text(
                                      'sahilsingh9733@gmail.com',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          fontSize: 16
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: _launchLI,
                            child: Tooltip(
                              message: 'LinkedIn',
                              waitDuration: Duration(milliseconds: 500),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(40, 10, 27, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.linkedin,
                                        color: Colors.white,
                                        size: 23,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 14),
                                        child: Text(
                                          'LinkedIn',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _launchGH,
                            child: Tooltip(
                              message: 'Projects',
                              waitDuration: Duration(milliseconds: 500),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 10, 40, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.githubSquare,
                                        color: Colors.white,
                                        size: 23,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 13),
                                        child: Text(
                                          'Projects',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),),
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 40, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: _launchSS,
                                child: Tooltip(
                                  message: 'StopStalk',
                                  waitDuration: Duration(milliseconds: 500),
                                  child: Container(
                                    // color: Colors.white,
                                    // elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(
                                            FontAwesomeIcons.code,
                                            color: Colors.white,
                                            size: 23,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 14),
                                            child: Text(
                                              'StopStalk',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

_launchPhone() async {
  const url = 'tel:+91 6202099733';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL() async {
  const url = 'mailto:sahilsingh9733@gmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchLI() async {
  const url = 'https://www.linkedin.com/in/sahil-singh-14548519a/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchGH() async {
  const url = 'https://github.com/SahilSinghzx77';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchSS() async {
  const url = 'https://www.stopstalk.com/user/profile/sahilsinghzx77';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}