import 'package:flutter/material.dart';
import 'package:smart_conference/utils/colours.dart';
import 'package:smart_conference/utils/font_text_Style.dart';
class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appSky, // Customize app bar color
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
          'Privacy Policy',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'This Privacy Policy statement is made by the Smart Conference Private Limited consisting of all the entities listed here (collectively, "we", "us" or "our") and is effective as of 29rdNov 2018. The goal of this policy is to make explicit the information we gather on our customers and users, how we will use it, and how we will not. This Privacy Policy applies to all Smart Conference websites, subdomain that link to it, unless notified. It also applies to the products and services provided by Smart-conference websites. This Privacy Policy does not apply to any of the events/conferences that are listed on our platform. Please refer to the privacy policies of the event/conferences before you provide consent to share your information with them.\n\n',
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
              TextSpan(
                text: 'INFORMATION WE COLLECT\n',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'We act as an intermediary platform, we hand over the personal details provided to us by your consent to the conference organizers. We recommend you to go through the privacy policy of the conference before you opt to register with the event, by registering on our website we don’t automatically handover any data to any conference organizer’s unless you explicitly provide consent to do on our platform.\n\n',
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
              TextSpan(
                text: 'Smart conference will collect information about you only if:\n(a) you have provided the information yourself,\n(b) smart conference has automatically collected the information, or\n(c) smart conference has obtained the information from a third party to which you had provided consent to share the data. Below we describe the various scenarios that fall under each of those three categories and the information collected in each one.\n\n',
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
              TextSpan(
                text: 'INFORMATION THAT YOU GIVE US\n',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'i. Account signup: When you sign up for an account to access our services, we ask for information like your name, contact number, email, address, photo. Your unique username will be your registered email id.\n\n',
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
              TextSpan(
                text: 'ii. Event registrations and other form submissions: We record information that you submit when you: (i) register for any event, including webinars or seminars, (ii) subscribe to our newsletter or any other mailing list, (iii) submit a form in order to download any product, whitepaper, or other materials, (iv) participate in contests or respond to surveys, or (v) submit a form to request customer support or to contact Smart Conference for any other purpose.\n\n',
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
              // Capitalizing and bolding the word "WORLD"
              TextSpan(
                text: 'iii. Payment processing: To make payment for our services/products, we ask you to provide yourcontact information, and credit card information or other payment account related information. We store the name and address of the credit/debit cardholder, the expiry date and the last four digits of the credit card number. We do not store the actual credit card number. If you have given us your explicit approval, the credit card information or other payment information is stored in an encrypted format in the secured servers of our Payment Gateway Service Providers.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),
              TextSpan(
                text: 'iv. Testimonials: When you authorize us to post testimonials about our products and services on websites, we may include your name and other personal information in the testimonial. You will be given an opportunity to review and approve the testimonial before we post it. If you wish to update or delete your testimonial, you can contact us at info@smartconference.in',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),
              TextSpan(
                text: 'v. Interactions with Smart Conference: We may record, analyze and use your interactions with us, including email, telephone, and chat conversations with our sales and customer support professionals, for improving our interactions with you and other customers.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),
              TextSpan(
                text: '',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
