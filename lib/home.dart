import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _img = "assets/day.png";
  bool _isStart = true;
  String _stopwatchText = '00:00:00';
  final _stopWatch = new Stopwatch();
  final _timeout = const Duration(seconds: 1);

  void _startTimeout() {
    new Timer(_timeout, _handleTimeout);
  }

  void _handleTimeout() {
    if (_stopWatch.isRunning) {
      _startTimeout();
    }
    setState(() {
      _setStopwatchText();
    });
  }

  void _startStopButtonPressed() {
    setState(() {
      if (_stopWatch.isRunning) {
        _isStart = true;
        _stopWatch.stop();
      } else {
        _isStart = false;
        _stopWatch.start();
        _startTimeout();
      }
    });
  }

  void _resetButtonPressed() {
    if (_stopWatch.isRunning) {
      _startStopButtonPressed();
    }
    setState(() {
      _stopWatch.reset();
      _setStopwatchText();
    });
  }

  void _setImg() {
    setState(() {
      if (_img == "assets/day.png") {
        _img = "assets/night.png";
      } else {
        _img = "assets/day.png";
      }
    });
  }

  void _setStopwatchText() {
    _stopwatchText = _stopWatch.elapsed.inHours.toString().padLeft(2, '0') +
        ':' +
        (_stopWatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(children: <Widget>[
      Image.asset(
        _img,
        fit: BoxFit.cover,
        height: 1000.0,
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment
              .center, //centraliza verticalmente o texto (alinhamento do eixo principal)
          children: <Widget>[
            Text(
              _stopwatchText,
              style: TextStyle(fontSize: 72),
            ),
            SizedBox(
              height: 80.0,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: Colors.black, // button color
                      child: IconButton(
                          icon: Icon(Icons.settings_backup_restore,
                              color: Colors.white),
                          onPressed: (_resetButtonPressed)),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ClipOval(
                    child: Material(
                      color: Colors.black, // button color
                      child: IconButton(
                          icon: Icon(_isStart ? Icons.play_arrow : Icons.pause,
                              color: Colors.white),
                          onPressed: (_startStopButtonPressed)),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ClipOval(
                    child: Material(
                      color: Colors.black, // button color
                      child: IconButton(
                          icon: Icon(Icons.photo_filter, color: Colors.white),
                          onPressed: (_setImg)),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    ]);
  }
}
