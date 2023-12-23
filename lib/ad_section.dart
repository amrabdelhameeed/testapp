import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AdsSection extends StatefulWidget {
  final bool isHomeSection;

  const AdsSection({super.key, this.isHomeSection = false});

  @override
  State<AdsSection> createState() => _AdsSectionState();
}

class _AdsSectionState extends State<AdsSection> {
  @override
  Widget build(BuildContext context) {
    InAppWebViewController webView;

    return AbsorbPointer(
      absorbing: true,
      child: SizedBox(
          height: 120,
          width: MediaQuery.of(context).size.width,
          child: ClipRect(
            child: InAppWebView(
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;

                webView.loadData(data: """
    <script async src="https://securepubads.g.doubleclick.net/tag/js/gpt.js"></script>
    <script>
      window.googletag = window.googletag || {cmd: []};
      googletag.cmd.push(function() {
        googletag.defineSlot('/21717998887/Mobile-app-970x250', [970, 250], 'div-gpt-ad-1703330610372-0').addService(googletag.pubads());
        googletag.pubads().enableSingleRequest();
        googletag.enableServices();
      });
    </script>
    <!-- /21717998887/Mobile-app-970x250 -->
    <div id='div-gpt-ad-1703330610372-0' style='min-width: 970px; min-height: 250px;'>
      <script>
        googletag.cmd.push(function() { googletag.display('div-gpt-ad-1703330610372-0'); });
      </script>
    </div>
  """);
              },
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(),
                  android: AndroidInAppWebViewOptions(thirdPartyCookiesEnabled: false, allowContentAccess: false, useHybridComposition: true, databaseEnabled: true)),
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                final uri = navigationAction.request.url!;
                // if (uri.toString().startsWith('https://googleads.g.doubleclick.net')) {
                //   launchUrl(uri);
                //   return NavigationActionPolicy.CANCEL;
                // }
                // return NavigationActionPolicy.ALLOW;
              },
            ),
          )),
    );
  }
}
