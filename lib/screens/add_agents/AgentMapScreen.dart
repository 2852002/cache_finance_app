import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TrackAgentScreen extends StatefulWidget {
  final String agentName;
  final String phoneNumber;
  final String email;

  const TrackAgentScreen({
    super.key,
    required this.agentName,
    required this.phoneNumber,
    required this.email,
  });

  @override
  _TrackAgentScreenState createState() => _TrackAgentScreenState();
}

class _TrackAgentScreenState extends State<TrackAgentScreen> {
  late WebViewController _webViewController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }

  void _handleLoad(String url) {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final appBarColor = isDarkMode ? Colors.white : Colors.white;
    final loadingColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          'Track Agent',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: appBarColor,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Map Section
              Expanded(
                flex: 6,
                child: WebView(
                  initialUrl:
                      'https://www.google.com/maps/@8.51968,77.6699904,14z?entry=ttu',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _webViewController = webViewController;
                  },
                  onPageFinished: _handleLoad,
                ),
              ),
            ],
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
              ),
            ),
        ],
      ),
    );
  }
}
