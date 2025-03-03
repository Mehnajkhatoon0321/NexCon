import 'package:flutter/material.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/font_text_Style.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final List<Map<String, dynamic>> privacyPolicyData = [
    {
      'heading': '',
      'content':
      'This Privacy Policy statement is made by the Smart Conference Private Limited consisting of all the entities listed here (collectively, "we", "us" or "our") and is effective as of 29rd Nov 2018. The goal of this policy is to make explicit the information we gather on our customers and users, how we will use it, and how we will not. This Privacy Policy applies to all Smart Conference websites, subdomain that link to it, unless notified. It also applies to the products and services provided by Smart-conference websites. This Privacy Policy does not apply to any of the events/conferences that are listed on our platform. Please refer to the privacy policies of the event/conferences before you provide consent to share your information with them.',
    },
    {
      'heading': 'INFORMATION WE COLLECT',
      'content':
      'We act as an intermediary platform, we hand over the personal details provided to us by your consent to the conference organizers. We recommend you to go through the privacy policy of the conference before you opt to register with the event. By registering on our website we don’t automatically handover any data to any conference organizer unless you explicitly provide consent to do on our platform.',
    },
    {
      'heading': 'INFORMATION THAT YOU GIVE US',
      'content': 'Account signup: When you sign up for an account to access our services, we ask for information like your name, contact number, email, address, photo Your unique username will be your registered email id.\n\nii. Event registrations and other form submissions: We record information that you submit when you : (i) register for any event, including webinars or seminars, (ii) subscribe to our newsletter or any other mailing list, (iii) submit a form in order to download any product, whitepaper, or other materials, (iv) participate in contests or respond to surveys, or (v) submit a form to request customer support or to contact Smart Conference for any other purpose.\n\niii. Payment processing: To make payment for our services/products, we ask you to provide yourcontact information, and credit card information or other payment account related information. We store the name and address of the credit/debit cardholder, the expiry date and the last four digits of the credit card number. We do not store the actual credit card number. If you have given us your explicit approval, the credit card information or other payment information is stored in an encrypted format in the secured servers of our Payment Gateway Service Providers.\n\niv. Testimonials: When you authorize us to post testimonials about our products and services on websites, we may include your name and other personal information in the testimonial. You will be given an opportunity to review and approve the testimonial before we post it. If you wish to update or delete your testimonial, you can contact us at info@smartconference.in\n\nv. Interactions with Smart Conference: We may record, analyze and use your interactions with us, including email, telephone, and chat conversations with our sales and customer support professionals, for improving our interactions with you and other customers.',
    },
    {
      'heading': 'INFORMATION THAT WE COLLECT AUTOMATICALLY',
      'content':
    'i. Information from browsers, devices and servers: When you visit our websites, we collect information that web browsers, mobile devices and servers make available, such as the internet protocol address, browser type, language preference, referring URL, date and time of access, operating system. We include these in our log files to understand more about visitors to our websites.\n\nii. Information from cookies and tracking technologies: We use temporary and permanent cookies to identify users of our services and to enhance user experience. We also use cookies,and other similar technologies to identify visitors,gather information about visitors and users, understand digital marketing effectiveness.\n\niii. Information from application logs and mobile analytics: We collect information about your use of our products, services and mobile applications from application logs and in-house usage analytics tools, and use it to understand how your business use and needs can improve our products. This information includes clicks, scrolls, features accessed, access time and frequency, errors generated, performance data, storage utilized, user settings and configurations, and devices used to access and their locations'   },

    {
      'heading': 'INFORMATION THAT WE COLLECT FROM THIRD PARTIES',
      'content':
   'i. Using 3rd party authentication service providers:These services will authenticate your identity and quickly create an account and give you the option to share certain personal information with us, such as your name and email address.\n\nii. Referrals:If someone has referred any of our products or services to you through any of our referral programs, that person may have provided us your name, email address and other personal information. You may contact us at privacy@smartconference.in to request that we remove your information from our database.\n\niii. Information from our reselling/marketing partners and service providers: If you contact any of our marketing/reselling partners, or otherwise express interest in any of our products or services to them, they partner may share your name, email address, contact details and other information to Smart Conference.\n\niv. If you register for or attend an event that is sponsored by SmartConference, the event organizer may share your information with us. Smart Conference may also receive information about you from review sites if you comment on any review of our products and services, and from other third-party service providers that we engage for marketing our products and services.\n\nv. Information from social media sites and other publicly available sources:When you interact or engage with us on social media sites such as Facebook, Twitter, and Instagram through posts, comments, questions and other interactions, we may collect such publicly available information, to allow us to connect with you, or help understand user requirements.This information may remain with us even if you delete it from the social media sites.But you can contact us to remove the information.'   },
    {
      'heading': 'PURPOSE TO USE YOUR INFORMATION',
      'content':
   'In addition to the purposes mentioned above, we may use your information for the following purposes:\n\ni. To communicate about our products &services that you have signed up for, changes to this Privacy Policy, or important notices/n/nii. To keep you posted on new products and services, upcoming events, offers, promotions and other information that we think will be of interest to you\n\niii. To ask you to participate in surveys, or to solicit feedback on our products and services\n\niv. To understand how users, use our products and services, to monitor and prevent problems, and to improve our products and services;\n\n  v. To detect and prevent fraudulent transactions and other illegal activities, to report spam, and to protect the rights and interests of Smart Conference, Smart Conference users, third parties and the public;\n\nvi. To update, expand and analyze our records, identify new customers, and provide products and services that may be of interest to you\n\nvii. To provide customer support.'   },
    {
      'heading': 'WHO WE SHARE YOUR INFORMATION WITH',
      'content':
   'We share your information only in the ways that are described in this Privacy Policy, and only with parties who adopt appropriate measures with respect to the use of your information.\nEmployees and independent contractors: Employees &independent contractors of Smart Conference group entities may have access to the information covered on a need-to-know basis. We require all employees and independent contractors to follow this Privacy Policy for personal information that we share with them\n\nThird-party service providers: We may need to share your personal information and aggregate or de-identified information with third-party service providers that we engage, such as marketing and advertising partners, event organizers, web analytics providers and payment processors. These service providers are authorized to use your personal information only as necessary to provide these services to us\n\nReselling and marketing partners:We may share your personal information with our authorized reselling partners in your region, solely for the purpose of contacting you about products that you have downloaded or services that you have signed up for.'
    },
  {
      'heading': 'EUROPEAN ECONOMIC AREA (EEA)',
      'content':
   'If you’re an individual from EEA our legal basis for information collection and use depends on the personal information concerned and the context in which we collect it are as follows:\nMost of our information collection and processing activities are typically based on:\n\n(i) Contractual necessity,\n\n(ii) One or more legitimate interests of Smart Conference or a third party that are not overridden by your data protection interests, or (iii) your consent.\n\n(iii) Sometimes, we may be legally required to collect your information, or may need your personal information to protect your vital interests or those of another person.\n\nWithdrawal of consent: Where we rely on your consent as the legal requirement, you have the right to withdraw your consent at any time, by reaching out to us about the same privacy@SmartConference.in but this will not affect any prior processing that has already taken place.\nLegitimate interests notice: Where we rely on legitimate interests as the legal basis and those legitimate interests are not specified above, we will clearly explain to you what those legitimate interests are at the time that we collect your information.'   },

  {
      'heading': 'INFORMATION USE DISCRETION',
      'content':
   'Opt out of non-essential electronic communications:You may opt out of receiving newsletters and other non-essential messages by using the ‘unsubscribe’ link included in all our emails. However, you will continue to receive notices, essential transactional and account related emails as long as you have an active account with us.\nDisable cookies:You can disable browser cookies before visiting our websites. However, certain website features may depend on the cookies to function.\nOptional information:You can always choose not to fill in non-mandatory fields when you submit any form linked to our websites./n/nIf you are in the European Economic Area (EEA), you have the following rights with respect to information that Smart Conference holds about you. Smart Conference undertakes to provide you the same rights no matter where you choose to live./n/nRight to access:/nYou have the right to access (and obtain a copy of, if required) the categories of personal information that we hold about you, including the information\'s source, purpose and period of processing, and the persons to whom the information is shared. Right to rectification:/nYou have the right to update the information we hold about you or to rectify any inaccuracies. Based on the purpose for which we use your information, you can ask to update the information about you in our database./n/nRight to erasure:/n/nYou have the right to request that we delete your personal information in certain circumstances, such as when it is no longer necessary for the purpose for which it was originally collected./n/nRight to restriction of processing:/nYou may also have the right to request to restrict the use of your information in certain circumstances, such as when you have objected to our use of your data but unless we have legitimate grounds to use it./n/nRight to object:/nYou have the right to object to the use of your information in certain circumstances, such as the use of your personal information for direct marketing./n/nRight to complain:/nYou have the right to complain to the appropriate supervisory authority if you have any grievance against the way we collect, use or share your information. This right may not be available to you if there is no supervisory authority dealing with data protection in your country.'   },
    {
      'heading': 'RETENTION OF INFORMATION',
      'content':
   'We retain your personal information for as long as it is required for the purposes stated in this Privacy Policy. Sometimes, we may retain your information for longer periods as permitted or required by law, such as to prevent abuse, if required in connection with a legal claim or proceeding, to enforce our agreements, for tax, accounting, or to comply with other legal obligations.\n\nWhen we no longer have a legitimate need to process your information, we will delete or anonymize your information from our active databases. We will also securely store the information and isolate it from further processing on backup until deletion is possible.'   },

  {
      'heading': 'INFORMATION ENTRUSTED',
      'content':
   'Information Provided You may entrust information that you or your organization (“you”) control, to Smart Conference for the purpose to use our services or to request technical support for our products/services. This includes information regarding your customers and your employees (if you are a controller) or data that you hold and use on behalf of another person for a specific purpose, such as a customer to whom you provide services (if you are a processor).\nThe data may either be stored on our servers when you use our services, or transferred or shared to us as part of a request for technical support or other services.\nInformation from mobile devices: We provide you complete control of your service data by providing you the ability to\n\n(i) access your data\n\n(ii) share your data through supported third-party integrations, and\n\n(iii) request export or deletion of your data.'   },
  {
      'heading': 'WHO WE SHARE DATA WITH',
      'content':
   'Smart conference group and third-party sub-processors: In order to provide services and technical support for our products, the contracting entity within the Smart conference group engages other and third parties.\nCollaborators and other users:\nSome of our products or services allow you to collaborate with other users or third parties. Initiating collaboration may enable other collaborators to view some or all of your profile information. For example, when you edit a document that you have shared with other persons for collaboration, your name and profile picture will be displayed next to your edits to allow your collaborators to know that you made those edits\n\nRetention of information:\nWe hold the data in your account as long as you choose to use Smart Conference Services. Once you terminate your Smart Conferenceuser account, your data will eventually get deleted from active database during the next clean-up that occurs once in 6 months. The data deleted from active database will be deleted from backups after 3 months.\n\nData subject requests:\nIf you are from the European Economic Area and you believe that we store, use or process your information on behalf of one of our customers, please contact the customer care if you would like to access, rectify, erase, restrict or object to processing, or export your personal data. We will extend our support to our customer in responding to your request within a reasonable timeframe.'   },
  {
      'heading': 'MINOR’S PERSONAL INFORMATION',
      'content':
   'Our products and services are generally not directed to individuals under 18(minor) Smart-conference does knowingly collect personal information from minoronly ifthere are conference listed on the platform which acceptminors. If we become aware that a minor has provided us with personal information, we will take steps to ensure we collect only the bare necessary. In any other case If you believe any minor has provided personal information to us, please write to privacy@smartconference.in with the details, and we will take the necessary steps to delete the information we hold about that minor.\n\nCOOKIES\nIn order to enhance your online experience and track the performance of the Site, our Site uses cookies. Our cookies help us improve your online experience, allow you to personalize your pages, enable us to customize our offerings. Cookies do not tell us who you are and contains non-personal information.\n\nFor administrative purposes, we also collect IP addresses and are not connected to any personally identifiable or on-line contact information like a name and address unless you order or register at our site; however, if you register, all information we have about you will be associated with your customer account. You have the ability to accept or decline cookies'

  },
    {
      'heading': 'HOW SECURE IS YOUR INFORMATION?',
      'content':
   'We make every reasonable effort to ensure that your data is secured.All the data transfer takes place over a secured socket layer. (SSL)'   },


    {
      'heading': 'DATA PROTECTION OFFICER',
      'content':
   'We have appointed a data protection officer to oversee our management of your personal information in accordance with this privacy policy. If you have any questions or concerns about our privacy practices with respect to your personal information, you can reach out to our data protection officer by sending an email to privacy@smartconference.in or by writing to: Data protection officer Smart Conference'

       },
 {
      'heading': 'LOCATIONS & INTERNATIONAL TRANSFERS',
      'content':
   'We share your personal information and service data with conference/events you opt for on ourwebsite. By accessing or using our products and services or otherwise providing personal information or service data to us, you consent to the processing, transfer, and storage of your personal information or Service Data within the United States of America, the European Economic Area (EEA) and other countries where Smart Conference operates. Such transfer is subject to a group company agreement that is based on EU Commission’s Model Contractual Clauses'},
 {
      'heading': 'DATA PROCESSING ADDENDUM',
      'content':
   'To enable you to be compliant with the data protection obligations under the General Data Protection Regulation, we are prepared to sign a Data Processing Addendum (DPA) that is based on Standard Contractual Clauses. You can request a DPA from us by completing Once we get your request, we\'ll forward the DPA to you for your signature.'   },
{
      'heading': 'EXTERNAL LINKS ON OUR WEBSITES',
      'content':
   'Some pages of our websites may contain links to websites that are not linked to this Privacy Policy. If you submit your personal information to any of these third-party sites, your personal information is governed by their privacy policies. It is suggested that you not share any personal information with these third parties without checking their privacy policies'   },
{
      'heading': 'LEGAL OBLIGATIONS FOR DISCLOSURE',
      'content':
   'We may be required by law to preserve or disclose your personal information and service data to comply with any applicable law, regulation, legal process or governmental request, including to meet national security requirements./nWe may disclose personal information and service data to a third party if we believe that such disclosure is necessary for preventing fraud, investigating any suspected illegal activity, enforcing our agreements or policies, or protecting the safety of our users.\n\nWe may modify the Privacy Policy at any time, upon notifying you through a service announcement or by sending an email to your primary email address We will notify you via email or through a prominent notice on our website of any change in ownership or in the uses of your personal information and service data. We will also notify you about any choices you may have with respect to your personal data.\n\nIf we make significant changes to the Privacy Policy that affect your rights, you will be provided with at least 30 days\' advance notice of the changes by email to your email address on our records.\n\nIf you think that the updated Privacy Policy affects your rights with respect to your use of our products or services, you may terminate your use by sending us an email within 30 days. Your continued use after the effective date of changes to the Privacy Policy will be deemed to be your agreement to the modified Privacy Policy.\n\nYou will not receive email notification of minor changes to the Privacy Policy. If you are concerned about how your personal information is used, you should check backat https://www.smartconference.in/privacy_policy.html periodically.\n\nWe make every reasonable effort, to ensure that personal information you provide is used in compliance with this Privacy Policy. If you have any concerns or the manner in which your personal information is used, kindly write to us privacy@Smart Conference.in with PRIVACY in the subject line. We\'ll respond to effectively address your concerns within reasonable time.'   },




  ];
  final List<Map<String, String>> tableData = [
    {
      'Name': 'Hostgator',
      'Purpose': 'Web Hosting and Database Services',
      'Processing Location': 'Hosted in USA',
      'Applicable Services': 'Web Hosting and Database Services',
    },
    {
      'Name': 'CC Avenue',
      'Purpose': 'Payment Gateway for collecting payment from organizers and delegates',
      'Processing Location': '',
      'Applicable Services': 'Payment Gateway for collecting payment from organizers and delegates',
    },
    {
      'Name': 'Comodo Certificate',
      'Purpose': 'SSL  To secure online transactions for customers and data from hacking',
      'Processing Location': '',
      'Applicable Services': 'To secure online transactions for customers and data from hacking',
    },
  ];
  @override
  Widget build(BuildContext context) {
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
          'Privacy Policy',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 16
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Privacy Policy sections
            ...privacyPolicyData.map((section) {
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
            Text(
              'Data Processing Table',
            style:FTextStyle.preHeading16BoldStyle
            ),
            const SizedBox(height: 8),


            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: SizedBox(
                      width: 150, // Fixed width for the column
                      child: Text(
                        'Name',
                        overflow: TextOverflow.ellipsis, // Handle overflow
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: 200, // Fixed width for the column
                      child: Text(
                        'Purpose',
                        overflow: TextOverflow.ellipsis, // Handle overflow
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: 180, // Fixed width for the column
                      child: Text(
                        'Processing Location',
                        overflow: TextOverflow.ellipsis, // Handle overflow
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: 250, // Fixed width for the column
                      child: Text(
                        'Applicable Services',
                        overflow: TextOverflow.ellipsis, // Handle overflow
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
                rows: tableData.map((row) {
                  return DataRow(cells: [
                    DataCell(
                      SizedBox(
                        width: 150, // Fixed width for each cell
                        child: Text(
                          row['Name'] ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis, // Handle overflow
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 200, // Fixed width for each cell
                        child: Text(
                          row['Purpose'] ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis, // Handle overflow
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 180, // Fixed width for each cell
                        child: Text(
                          row['Processing Location'] ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis, // Handle overflow
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 250, // Fixed width for each cell
                        child: Text(
                          row['Applicable Services'] ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis, // Handle overflow
                        ),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
