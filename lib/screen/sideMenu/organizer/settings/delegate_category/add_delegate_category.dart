import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nexcon/utils/colours.dart';
import 'package:nexcon/utils/flutter_flow_animations.dart';
import 'package:nexcon/utils/font_text_Style.dart';
class AddDelegateCategory extends StatefulWidget {
  const AddDelegateCategory({super.key});

  @override
  State<AddDelegateCategory> createState() => _AddDelegateCategoryState();
}

class _AddDelegateCategoryState extends State<AddDelegateCategory> {
  @override
  Widget build(BuildContext context) {
    final animationsMap = {
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.ms,
            duration: 600.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.ms,
            duration: 600.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.ms,
            duration: 600.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.ms,
            duration: 600.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Delegate Category',
          style: FTextStyle.HeadingTxtWhiteStyle,
        ),
        actions: [],
        centerTitle: true,

      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Conference Category",
              style: FTextStyle.SubHeadingTxtStyle,
            ).animateOnPageLoad(
                animationsMap['imageOnPageLoadAnimation2']!),
            // Padding(
            //   padding:
            //   const EdgeInsets.symmetric(vertical: 10.0),
            //   child: DropdownButtonFormField<String>(
            //     key: _genderKey,
            //     focusNode: _selectGenderFocusNode,
            //     value: genderTitleName,
            //     hint: const Text(
            //       "Select Conference Category",
            //       style: FTextStyle.formhintTxtStyle,
            //     ),
            //     items: sexTitleName
            //         .map((category) => DropdownMenuItem(
            //       value: category,
            //       child: Text(category),
            //     ))
            //         .toList(),
            //     onChanged: (newValue) {
            //       setState(() {
            //         genderTitleName = newValue;
            //       });
            //       _genderKey.currentState?.validate(); // Validate only this field
            //     },
            //     decoration: FormFieldStyle.dropDown,
            //     validator: ValidatorUtils.model,
            //   ),
            // ),
        
        
        
          ],
        ),
      ),

    );
  }
}
