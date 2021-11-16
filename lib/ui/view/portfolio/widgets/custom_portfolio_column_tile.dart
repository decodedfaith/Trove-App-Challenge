import 'package:flutter/material.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';
import 'package:trove_app_challenge/utilities/constants/text_styles.dart';
import 'package:trove_app_challenge/utilities/constants/ui_helpers.dart';

class PortfolioColumnTile extends StatelessWidget {
  const PortfolioColumnTile({
    Key? key,
    this.symbol,
    this.pricePershare,
    this.equityValue,
    this.totalQuantity,
    this.color,
  }) : super(key: key);
  final String? symbol;
  final dynamic pricePershare;
  final dynamic equityValue;
  final dynamic totalQuantity;
  final color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        displayWidth(context) * 0.02,
      ),
      child: Container(
        height: displayHeight(context) * 0.0837,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color,
              color,
              color,
              color,
              AppColors.whiteColor,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(displayWidth(context) * 0.04),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              symbol!,
              style: AppTextStyle.whiteBoldSize16(context),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '\$ $equityValue',
                  style: AppTextStyle.whiteBoldSize16(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'p/ps - $pricePershare',
                      style: AppTextStyle.whiteBoldSize16(context),
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.0466,
                    ),
                    Text(
                      't/qty - $totalQuantity',
                      style: AppTextStyle.whiteBoldSize16(context),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
