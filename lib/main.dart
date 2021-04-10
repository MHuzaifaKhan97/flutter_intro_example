import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeatureDiscovery(
          recordStepsInSharedPreferences: false, child: DemoApp()),
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FeatureDiscovery.discoverFeatures(context, <String>[
        'feature1',
        'feature2',
        'feature3',
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DescribedFeatureOverlay(
            featureId: 'feature2',
            targetColor: Colors.white,
            textColor: Colors.white,
            backgroundColor: Colors.blue,
            contentLocation: ContentLocation.below,
            title: Text(
              'Menu Icon',
              style: TextStyle(fontSize: 20.0),
            ),
            pulseDuration: Duration(seconds: 1),
            enablePulsingAnimation: true,
            overflowMode: OverflowMode.clipContent,
            openDuration: Duration(seconds: 1),
            description: Text(
                'This is Button you can add more details heres\n New Info here add more!',
                style: TextStyle(fontSize: 16.0, color: Colors.white)),
            tapTarget: Icon(Icons.menu),
            child: IconButton(icon: Icon(Icons.menu), onPressed: () {})),
        title: Text('Demo App'),
        centerTitle: true,
        actions: [
          DescribedFeatureOverlay(
              featureId: 'feature3',
              targetColor: Colors.white,
              textColor: Colors.black,
              backgroundColor: Colors.amber,
              contentLocation: ContentLocation.trivial,
              title: Text(
                'More Icon',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              pulseDuration: Duration(seconds: 1),
              enablePulsingAnimation: true,
              barrierDismissible: false,
              overflowMode: OverflowMode.wrapBackground,
              openDuration: Duration(seconds: 1),
              description: Text('This is Button you can add more details heres',
                  style: TextStyle(fontSize: 16.0, color: Colors.white)),
              tapTarget: Icon(Icons.search),
              child: IconButton(icon: Icon(Icons.search), onPressed: () {})),
        ],
      ),
      body: Center(
        child: Container(
          child: DescribedFeatureOverlay(
            featureId: 'feature1',
            targetColor: Colors.white,
            textColor: Colors.black,
            backgroundColor: Colors.purpleAccent,
            contentLocation: ContentLocation.above,
            title: Text(
              'This is Home Button',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            pulseDuration: Duration(seconds: 1),
            enablePulsingAnimation: true,
            barrierDismissible: false,
            overflowMode: OverflowMode.extendBackground,
            openDuration: Duration(seconds: 1),
            description: Text('This is Button you can add more details heres',
                style: TextStyle(fontSize: 16.0, color: Colors.white)),
            tapTarget: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            child: IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              onPressed: () {},
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
