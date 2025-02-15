import 'package:flutter/material.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
class TermCondition extends StatefulWidget {
  const TermCondition({super.key});

  @override
  State<TermCondition> createState() => _TermConditionState();
}

class _TermConditionState extends State<TermCondition> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> termConditionData = [
    {
      'heading': '',
    'content':
    ' Please read the following Terms & Conditions carefully before entering this website.\n\nThis is an Agreement between you or with your legalguardian if you’re a minor (hereinafter referred to as “you” or “your” or “user”) and smartconference.in, (hereinafter referred to as “smart conference” , “website” or “we” or “ur”) a incorporated under the laws of India, with its registered office at Lucknow, India. That governs the access and use of the www.smartconference.in website (hereinafter referred to as “Website”). When you access the website, you agree to be bound by these Terms and Conditions & our Privacy Policy.',
  }, {
      'heading': '1. Disclaimer and Liability',
    'content':
    ' All information,answers andcontent are posted by exercising reasonable due diligence. The information available on the site is not meantfor any other use other than for the purpose for which it is posted on the website. Hence, the information posted should not be relied upon for any other purpose or use other than the intended purpose on the website. The website doesn’t warrant any authenticity or accuracy of any information and the website shall not be liable for any claim that may arise out of this. The user agrees to indemnify the site against all actions brought out in this regard.\n\nThe answers, information, material and content on the site do not construed as an advice to the user. Any action taken by the user on the basis of the information contained on the site is the responsibility of the user alone and Smart Conference will not be liable in any manner for the consequences of such action taken by the user./n/nYou agree to the following terms unconditionally:/n/n(A) To hold free the site of all liabilities that may arise from the direct or indirect use of the information available on the site.\n(B) The user agrees that not every possible query may be answerable by the site if sufficient data for the same is not available with the website.\n(C) The website will exercise reasonable care to make sure the information, answers given are true to its knowledge. But the website can’t be held liable if the answers to the queries turn out to be untrue partially or completely, or any consequences that may arise on relying on such answers.\n(D) The website does not provide any implied warranties of merchantability, fitness for a particular purpose. Smart Conference shall not be liable, at any time, for any failure of performance, error, omission, interruption, deletion, defect, delay in operation or transmission, computer virus, communications line failure, theft or destruction or unauthorized access to, alteration of, or use of information contained at this site.\n(E) The user is aware and understands that Smart Conference does not provide any warranty regarding the authenticity or correctness of the content of other services or sites that the hyperlinks refer to.\n(F) The user is aware and understands that a link to another service or site is not an endorsement of the service or site and Smart Conference is not liable for any consequences of any act or omission on the part of the user on the basis of the information contained in such other services or sites.\n(G) Smart Conference reserves its right to monitor the use of all or any part of its service without any prior intimation or any obligation to the user.\n(H) The information, content on website should not be put toany use that constitutes a violation of the copyright of Smart Conference or any legal rights of a third-party information provider.\n(I) You agree not to copy, reproduce, republish, upload, post, transmit or distribute the material in any way for any use without obtaining the prior written consent from Smart Conference.',
  }, {
      'heading': '2. User Data',
    'content':
    ' The user is liable to keep his/her account credentials safe & secure and shall be held solely responsible for all acts and omissions that occur under his password or account. Smart Conference cannot and will not be liable for any loss or damage arising from the user’s failure to comply with the terms and conditions of this agreement./nTo know more about how we process your data please go through our privacy policy.',
  },
      {
      'heading': '3. Conduct & Prohibited Acts',
    'content':
    ' The Smart Conference service is made available for your personal, non-commercial use only. Businesses, organizations or other legal entities shall require prior permission by contacting us at info@smartconference.in For using the Smart Conference services for any purpose.\n\n(A) You are prohibited from using the Smart Conference service for any illegal or unauthorized purpose. International users agree to comply with Indian laws. You are solely responsible for your conduct and any data, text, information, graphics, photos, profiles, audio and video clips, links and other material that you submit, post, and display on the Smart Conference service.\n((B) The site may at its sole discretion remove information, content or material that is incorrect, inaccurate, unlawful, defamatory, obscene or otherwise objectionable, or infringes or violates any party\'s intellectual property or any other legal rights or these Terms of Service.\n ((C) Other examples of illegal or unauthorized uses include, but are not limited to:\n((D) You\’re not allowed to Modify, adapt, translate, or reverse engineering any portion of the Smart Conference service; Removal of any copyright, trademark or other proprietary rights notices contained in or on the Smart Conference service;\n((E) Collection of any information (including usernames and/or email addresses) for unauthorized purposes; Reformatting or framing any portion of the web pages that are part of the Smart Conference service; creating user accounts by automated means or under false or fraudulent pretences; Createor transmit unwanted electronic communications such as "spam," or chain letters to other user or otherwise interfering with other user’s enjoyment of the service;\n((F) User shall not submit any information or material of any third party without such third party\'s prior written consent; or material that infringe, misappropriate or violate the intellectual property, publicity, privacy or other proprietary rights of any party or that are unlawful or promote or encourage illegal activity; or submitting false or misleading information.\n((G) Upload, post, email or otherwise transmit any Content that you do not have a right to transmit under any law or under contractual or fiduciary relationships (such as inside information, proprietary and confidential information learned or disclosed as part of employment relationships or under non-disclosure agreements);\n((H) Any other conduct, act or behaviour that is illegal or unlawful.',
  },
    {
      'heading': '4. USAGE OF POINTS',
    'content':
    'The user shall not use any non-genuine means for getting access to free points. If found guilty, Smart Conference can unanimously terminate or suspend the existing user account without any prior information./n/nThe user agrees that he shall not solicit or invite other users to share the credits/points that he earns, that accrue to him in his individual capacity; and agrees not to sell the credits/points for any consideration to a third party./n/nIn case of a violation of this condition the user shall become liable to pay for the credits/points sold or shared and all his credits/points accumulated, shall be forfeited and such accounts shall be terminated without prior notice. ',
  },
      {
      'heading': '5. Termination',
    'content':
    'We may terminate your membership immediately at any time, with or without prior notice, for any reason. Our proprietary rights, disclaimer of warranties, indemnities, limitations of liability and miscellaneous provisions shall survive any termination of your membership. Smart Conference shall not be liable to you or any third-party for any termination of your access to the Service. ',
  },
      {
      'heading': '6. Advertisements',
    'content':
    'The site may at its discretion display advertisements. The user’s correspondence or business dealings with, or participation in promotions of, advertisers found on or through the Smart Conference service, including payment and delivery of related goods or services, and any other terms, conditions, warranties or representations associated with such dealings, are solely between the user and such advertiser.\nThe user agrees that Smart Conference shall not be responsible or liable for any loss or damage of any sort incurred as the result of any such dealings or as the result of the presence of such advertisers on the Smart Conference service.'
      ,
  },
      {
      'heading': '7. Refund & Cancellation Policy\n\n(i) For Conference Organizer',
    'content':
    'The Conference Organizer may cancel their account with Smart Conference at any time by submitting an email request to Support@smartconference.in. Cancelled accounts may be deleted immediately upon reaching the requested date of cancellation and without backup provisions.\n\nAt Smart Conference\'s option, a refund of paid fees, after deducting the administrative charge, may be made if the account is unused and the cancellation request is received within fifteen (15) days from the account being set up.\n\nIn other cases conference organizer may submit the request to withdraw the balance credits available in their e-Wallet at any point of time through their account login. Refund will be made within 7 working days to the bank account details provided by the account holder after deducting the bank transfer charges + taxes as applicable. ',
  },
      {
      'heading': '(ii) For Delegates/Users',
    'content':
    'The Smart Conference does not set refund policies on behalf of the Conference Organisers. It is the responsibility of the Organiser to communicate its refund policy to Delegate/User and to issue refunds in accordance therewith. Consequently, please note:\n\n(A) User\'s requests for refunds should be directed to the respective Organiser and in no event shall be directed to the Company.\n(B) Any refund-related issues or disputes shall be strictly between the User and the Organiser; the Company shall not be liable for any refund-related claims in connection with event Services; and the Organiser hereby agrees to indemnify, defend, and hold harmless the Company in connection therewith.\n(C) In the event, an event is cancelled or postponed by the Organiser for whatever reason, the Company will attempt to refund the amount as per the policy of the organizer.\n(D) In case of any *Event Cancellations/Event Postpone, full refunds will be initiated only upon on the organizer\'s confirmation (conditions may vary for different events).\n(E) Any Cancellation Requests/Refund Requests raised by the customers/end users will be considered only upon the organizer\'s confirmation and for the same, Payment Gateway Charges + Taxes will be deducted from the paid amount, depending upon the organizer\'s terms set for the event (conditions may vary for different events). ',
  },
      {
      'heading': '8. Proprietary Rights',
    'content':
    ' You acknowledge and agree that the Smart Conference service and any necessary software used in connection with the service may contain proprietary and confidential information that is protected by the intellectual property and other laws of India.\n\nInformation contained in sponsor advertisements or information presented to you through the Smart Conference services or advertisers is protected by copyrights, trademarks, service marks, any other proprietary/legal rights that may apply.\n\n Unless expressly authorized by Smart Conference or advertisers, you agree not to modify, rent, lease, loan, sell, distribute or create derivative any works of any content that is available on the Smart Conference service, in whole or in part.',
  },
      {
      'heading': '9. Disclaimer of Warranties',
    'content':
    'Your use of the service is at your sole risk. The service is provided on an "as is" and "as available" basis. Smart Conference expressly disclaims all warranties of any kind, whether express or implied, including, but not limited to the implied warranties of merchantability, fitness for a particular purpose and non-infringement.\n\nSmart Conference makes no warranty that:\n\n(A) The service will meet your requirements, or the service will be uninterrupted, timely, secure, or error-free\n(B) The results that may be obtained from the use of the service will be accurate or reliable.\n(C) The quality of any products, services, information, or other material purchased or obtained by you through the service will meet your expectations, or are tailored for any specific use.\n(D) Any errors in the software will be corrected.\n\nAny material downloaded or otherwise obtained through the use of the service is done at your own discretion and risk and that you will be solely responsible for any damage to your computer system or loss of data that results from the download of any such material.\n\nNo advice or information, whether oral or written, obtained by you from Smart Conference or through or from the service shall create any warranty not expressly stated in the terms of service.',
  },
{
      'heading': '10. Severability &Limitation of Liability',
    'content':
    'Under no circumstances will Smart Conference be liable to you for any indirect, incidental, consequential, special or exemplary damages arising out of or in connection with use of the Smart Conference service, whether or not Smart Conference has been advised of the possibility of such damages./n/neverability: If any provision of this Agreement is invalid, illegal, or unenforceable, the remainder of this Agreement will remain in full force and effect.\n\nThe Following limitation of liability shall apply with respect to the use of services:\n\n(A) Whether the damages arise from use or misuse of and reliance on the Smart Conference service, from inability to use the Smart Conference service, or from the interruption, suspension, or termination of the Smart Conference se0072vice (including such damages incurred by third parties),\n\n(B) Under no circumstances shall Smart Conference be liable to you for any amount exceeding one thousand rupees. ',
  },
{
      'heading': '11. Indemnity',
    'content':
    'You agree to indemnify and hold Smart Conference, and its subsidiaries, affiliates, officers, agents, co-branders or other partners, and employees, harmless from any claim or demand, including reasonable legal expenses, made by any third party due to or arising out of your direct or indirect use of the service or any transmit through the Smart Conference service, your use of the Service, your connection to the Service, your violation of the Terms of Service, or your violation of any rights of another. ',
  },
{
      'heading': '12. Modification of Service',
    'content':
    'Smart Conference reserves the right at any time to modify or discontinue, temporarily or permanently, the service (or any part thereof) with or without notice. You agree that Smart Conference shall not be liable to you or to any third party for any modification, suspension or discontinuance of the service. ',
  },
{
      'heading': '13. Intellectual Property',
    'content':
    'The user agrees not to infringe any intellectual property of Smart Conference and other entities whose details are posted on the website in any manner whatsoever.The site design and the service marks, graphics and other logos and product and service names are trademarks of Smart Conference Pvt. Ltd.\n\nYou agree not to display or use in any manner, the trademarks of Smart Conference. If you believe that your work has been copied in a way that constitutes a copyright infringement, please contact us at info@smartconference.in ',
  },
{
      'heading': '14. Dispute Resolution & Claims',
    'content':
    'These Terms of Service will be governed by and construed in accordance with the laws of India and any dispute arising out the use of the site shall be subject to arbitration in India.\n\n(A) The arbitrator shall be appointed by the website, after due consultation with the user and the decision of the arbitrator his/her decision shall be considered final and binding.\n(B) The exclusive jurisdiction shall be with the courts at Lucknow, India. If any provision or portion of the terms of service is declared unenforceable by court of law the remainder of the contract will continue in full force &effect.\n(C) You shall not assign these terms of service or assign any rights or delegate any obligations hereunder, in whole or in part, whether voluntarily or by operation of law, without our prior written consent, any such purported assignment or delegation will be null and void at our discretion.\n(D) We respect the rights and intellectual property of others, and we ask our users to do the same. If you believe that your product or other work has been misrepresented or used in a way that constitutes copyright infringement, or your intellectual property rights have been otherwise violated. ',
  },
{
      'heading': '15. Data Processing &Privacy',
    'content':
    'Your privacy is critically important to us. We maintain a procedure in order to help you confirm that your Personally Identifiable Information remains correct and up-to-date or choose whether or not you wish to receive material from us or some of our partners. To Learn more please go through the privacy policy.\nFor any queries please contact us at info@smartconference.in with Privacy mentioned in the subject line. ',
  },
{
      'heading': '16. Miscellaneous',
    'content':
    'The use of the website, or any of its services or features provided by the site, including any of the information and material contained therein implies and constitutes the user’s consent to this agreement, the user unequivocally agrees to abide by these terms and condition.\n\nWe reserve our right to modify or terminate the Smart Conference service for any reason, without prior notice, without liability to you or any other members or third party. We also reserve the right to modify the Terms of Service from time to time without notice. In case of any significant changes we will notify of the same through your account dashboard or by sending an email to your registered email account in our database.\nThis contract i.e. Terms & Conditions along with the privacy policy constitute the entire agreement between you &the website Smart conference Pvt. Ltd. with respect to access to the website and the services /products offered on the website. This agreement supersedes and replaces all prior agreements, communication written or oral. if you have any queries, please reach out to info@smartconference.in or write to us address 315/41, Bagh Maha Narayan, Chowk, Lucknow - 226003 (U.P.), India. ',
  },


    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.appSky, // Customize app bar color
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 28,
          ), // Menu icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Terms & Conditions',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Privacy Policy sections
            ...termConditionData.map((section) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (section['heading'] != null && section['heading'] != '')
                      Text(
                          section['heading']!,
                          style:FTextStyle.preHeading16BoldStyle
                      ),
                    const SizedBox(height: 8),
                    Text(
                        section['content'] ?? '',
                        style:FTextStyle.subtitle
                    ),
                  ],
                ),
              );
            }).toList(),

            // Table section added below
            const SizedBox(height: 20),


          ],
        ),
      ),
    );
  }
}
