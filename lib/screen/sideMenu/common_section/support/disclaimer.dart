import 'package:flutter/material.dart';

import '../../../../utils/font_text_Style.dart' show FTextStyle;
class Disclaimer extends StatefulWidget {
  const Disclaimer({super.key});

  @override
  State<Disclaimer> createState() => _DisclaimerState();
}

class _DisclaimerState extends State<Disclaimer> {
  @override
  Widget build(BuildContext context) {
    String disclaimerText = '''
Please read the following Terms & Conditions carefully before entering this website.

The information contained in this site is authentic to the best of our knowledge. However, smartconference.in shall not be responsible for unintended errors that may have crept into this site. Also smartconference.in doesn't provide any warranty that the services provided by it will meet your expectations and requirements. The information and sectional tips provided for various services should be taken in its spirit of being a suggestive opinion of smartconference.in only.

This information is also written without any malice towards anyone or any institution and therefore any offence caused to anyone or any institution concerned or not concerned, is regretted.

The information/ data and products on this Website, including but not limited to text, images, graphics, audio-visuals, videos and links is provided “as-is” and without warranties of any kind, whether express or implied, including but not limited to implied warranty of accuracy, completeness, reliability, merchantability or fitness for a particular purpose.

Any information/ data provided in this Website about the separate third party service providers and/ or Smart Conference and/ or any conclusions based on the available information/ data does not necessarily reflect the view/s of Smart Conference and/ or its Affiliates.

Visitors to this Website access the Website at their own risk.

The photographs, images, audio-visuals and the videos used herein are purely for illustrative purposes only.

This Website may include technical inaccuracies or typographical errors, and we make no guarantees, nor can we be responsible for any such information, including its authenticity, currency, content, quality, copyright compliance or legality, or any resulting loss or damage.

Unauthorized access, reproduction, redistribution, transmission and/or dealing with any information contained in this Website in any other manner, either in whole or in part, are strictly prohibited, failing which strict legal action will be initiated against you as per applicable laws.

You may have arrived on this website by means of some link provided by a third party. You understand that any such links are provided by third parties to this site and who have no connection to Smart Conference whatsoever. Smart Conference neither endorses the contents of such websites nor do we endorse the creators or the hosts of such websites, unless expressly stated in writing otherwise.

We may also provide certain links to other third party websites within this Website as a convenience to you. You understand that this is purely for your understanding and convenience, and any decision that you might take on the basis of such reading is entirely your choice. We do not endorse the contents of such websites nor do we endorse the creators or the hosts of such website, unless expressly stated in writing otherwise.

When you click on advertiser banners, sponsor links, or other external links from this Website, your browser automatically may direct you to a new browser window that is not hosted or controlled by Smart Conference. We are not responsible for the content, functionality, authenticity or technological safety of these external websites. We reserve the right to disable links to or from third-party sites to our Website, as we may deem it fit. This right to disable links includes links to or from advertisers, sponsors, and content partners that may use our trademarks as part of a co-branding relationship.

Some external links may produce information that you may find objectionable, inappropriate, or offensive. We are not responsible for the accuracy, relevancy, copyright compliance, legality, or decency of material contained in any externally linked Websites.
''';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text("Disclaimer",  style: FTextStyle.HeadingTxtWhiteStyle,), centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Services We Offer", style: FTextStyle.headingMiddle),
            ),
            Text(
              disclaimerText,
              style: const TextStyle(fontSize: 14, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
