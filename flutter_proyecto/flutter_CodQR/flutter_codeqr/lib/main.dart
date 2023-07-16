import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
//import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isAnimated = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    setState(() {
      _isAnimated = !_isAnimated;
      if (_isAnimated) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Container Example'),
        ),
        body: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: _isAnimated ? 200 : 100,
            height: _isAnimated ? 200 : 100,
            color: _isAnimated ? Colors.blue : Colors.red,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleAnimation,
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}

class QRScannerApp extends StatefulWidget {
  @override
  _QRScannerAppState createState() => _QRScannerAppState();
}

class _QRScannerAppState extends State<QRScannerApp> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  bool scanning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: _buildQRView(context),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    scanning = !scanning;
                  });
                },
                child: Text(scanning ? 'Detener escaneo' : 'Reanudar escaneo'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQRView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      _launchURL(scanData.code);
    });
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('No se pudo lanzar la URL: $url');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

launch(String url) {}

canLaunch(String url) {}
