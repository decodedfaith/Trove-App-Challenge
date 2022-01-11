import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trove_app_challenge/ui/view/loan/loan_viewmodel.dart';
import 'package:trove_app_challenge/utilities/constants/ui_helpers.dart';

class LoanView extends StatelessWidget {
 const LoanView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<LoanViewModel>.reactive(
     builder: (context, model, child) => 
     Scaffold(
       body: SingleChildScrollView(
         child: Padding(
           padding: UIHelper.bodyPadding(context),
           child: Container(),
         ),
        ),
     ),
     viewModelBuilder: () => LoanViewModel(),
   );
 }
}