import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/screen/organizer_section/upgrade_plan/payment_option_selection.dart' show UpgradeMembershipPayment;
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
import 'package:nexcon/utils/form_field_style.dart';
import 'package:nexcon/utils/validator_utils.dart';
class UpgradeMembership extends StatefulWidget {
  const UpgradeMembership({super.key});

  @override
  State<UpgradeMembership> createState() => _UpgradeMembershipState();
}

class _UpgradeMembershipState extends State<UpgradeMembership> {
  // Animations
  final animationsMap = {
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(40.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  final formKey = GlobalKey<FormState>();
  String? conferenceCategoryTitleName;

  // Controllers
  final creditController = TextEditingController();
  final couponController = TextEditingController();
  final totalAmountController = TextEditingController(text: "0");
  final payAmountController = TextEditingController(text: "0");

  final wishlistController = TextEditingController();
  final delegateNumberController = TextEditingController();

  // FocusNodes
  final _wishlistFocusNode = FocusNode();
  final _creditFocusNode = FocusNode();
  final _couponFocusNode = FocusNode();
  final _delegateNumberFocusNode = FocusNode();
  final _conferenceCategoryFocusNode = FocusNode();

  // Keys
  final _wishlistKey = GlobalKey<FormFieldState<String>>();
  final _creditKey = GlobalKey<FormFieldState<String>>();
  final _delegateNumberKey = GlobalKey<FormFieldState<String>>();
  final _conferenceCategoryKey = GlobalKey<FormFieldState<String>>();

  bool isButtonEnabled = false;
  bool isWaitlistFieldFocused = false;
  bool isCreditFieldFocused = false;
  bool isDelegateNumberFieldFocused = false;

  @override
  void initState() {
    super.initState();

    creditController.addListener(_updateAmounts);
    couponController.addListener(_updateAmounts);


    _wishlistFocusNode.addListener(() {
      if (!_wishlistFocusNode.hasFocus) {
        _wishlistKey.currentState?.validate();
      }
    });

    _creditFocusNode.addListener(() {
      if (!_creditFocusNode.hasFocus) {
        _creditKey.currentState?.validate();
      }
    });

    _delegateNumberFocusNode.addListener(() {
      if (!_delegateNumberFocusNode.hasFocus) {
        _delegateNumberKey.currentState?.validate();
      }
    });

    _conferenceCategoryFocusNode.addListener(() {
      if (!_conferenceCategoryFocusNode.hasFocus) {
        _conferenceCategoryKey.currentState?.validate();
      }
    });
  }

  // void _updateAmounts() {
  //   final credit = int.tryParse(creditController.text) ?? 0;
  //   final coupon = int.tryParse(couponController.text) ?? 0;
  //
  //   final total = credit * 50;
  //   int pay = total;
  //
  //   if (coupon > 0 && coupon <= total) {
  //     pay = total - coupon;
  //   }
  //
  //   totalAmountController.text = total.toString();
  //   payAmountController.text = pay.toString();
  // }
  final Set<String> validCoupons = {'qwerrt', 'abc123', 'FLUTTER10'};

  void _updateAmounts() {
    final credit = int.tryParse(creditController.text) ?? 0;
    final couponText = couponController.text.trim();

    final total = credit * 50;
    int pay = total;

    if (couponText.isNotEmpty) {
      final couponValue = int.tryParse(couponText);

      if (couponValue != null && couponValue > 0 && couponValue <= total) {
        // Numeric coupon code - fixed discount
        pay = total - couponValue;
      } else if (validCoupons.contains(couponText)) {
        // Valid string coupon code - 10% discount
        pay = (total * 0.9).round();
      } else {
        // Invalid coupon - no discount applied, pay = total
        pay = total;
      }
    } else {
      // No coupon - pay full amount
      pay = total;
    }

    totalAmountController.text = total.toString();
    payAmountController.text = pay.toString();
  }



  @override
  void dispose() {
    creditController.dispose();
    couponController.dispose();
    totalAmountController.dispose();
    payAmountController.dispose();
    wishlistController.dispose();
    delegateNumberController.dispose();

    _wishlistFocusNode.dispose();
    _creditFocusNode.dispose();
    _couponFocusNode.dispose();
    _delegateNumberFocusNode.dispose();
    _conferenceCategoryFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appSky,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Upgrade Membership', style: FTextStyle.HeadingTxtWhiteStyle),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          onChanged: () {
            final credit = int.tryParse(creditController.text) ?? 0;
        
            setState(() {
              isButtonEnabled = credit > 0 &&
                  ValidatorUtils.isValidCommon(wishlistController.text) &&
                  ValidatorUtils.isValidCommon(delegateNumberController.text);
            });
        
            if (isWaitlistFieldFocused) _wishlistKey.currentState?.validate();
            if (isDelegateNumberFieldFocused) _delegateNumberKey.currentState?.validate();
            if (isCreditFieldFocused) _creditKey.currentState?.validate();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.01),
                Text('Add Credit Points', style: FTextStyle.headingMiddle),
        
                SizedBox(height: height * 0.02),
        
                Text("Credit Points / Delegates", style: FTextStyle.SubHeadingTxtStyle)
                    .animateOnPageLoad(animationsMap['imageOnPageLoadAnimation2']!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child:  TextFormField(
                    key: _creditKey,
                    focusNode: _creditFocusNode,
                    controller: creditController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Credit",
                    ),
                    // validator: ValidatorUtils.model,
                    onTap: () {
                      setState(() {
                        isCreditFieldFocused = true;
                        isWaitlistFieldFocused = false;
                        isDelegateNumberFieldFocused = false;
                      });
                    },
                  ),
                ),
        
                Text("Total Amount*", style: FTextStyle.SubHeadingTxtStyle),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child:  TextFormField(
                    controller: totalAmountController,
                    enabled: false,
                    readOnly: true,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      suffixText: 'INR',
                      hintText: "Total Amount",
                    ),
                  ),
                ),
        
                Text("Coupon Code (if you have)", style: FTextStyle.SubHeadingTxtStyle),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child:  TextFormField(
                    controller: couponController,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      hintText: "Enter Coupon Code",
                    ),
                  ),
                ),
        
                Text("Pay Amount", style: FTextStyle.SubHeadingTxtStyle),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child:  TextFormField(
                    controller: payAmountController,
                    enabled: false,
                    readOnly: true,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                    decoration: FormFieldStyle.defaultAddressInputDecoration.copyWith(
                      suffixText: 'INR',
                      hintText: "Pay Amount",
                    ),
                  ),
                ),
        
                Text(
                  "(Note: 18.0% Tax will be applied on this price for organizers from India.)",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),

                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(

                    onPressed:  () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UpgradeMembershipPayment()));
                   }
                    },

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      backgroundColor: AppColors.appSky,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: Text("Continue", style: FTextStyle.loginBtnStyle),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

