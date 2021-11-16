import 'package:flutter/material.dart';
import 'package:trove_app_challenge/ui/view/portfolio/portfolio_viewmodel.dart';
import 'package:trove_app_challenge/ui/view/portfolio/widgets/custom_portfolio_column_tile.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';
import 'package:trove_app_challenge/utilities/constants/text_styles.dart';
import 'package:trove_app_challenge/utilities/constants/ui_helpers.dart';

class PortfolioTile extends StatelessWidget {
  final PortfolioViewModel model;
  const PortfolioTile({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(
          displayWidth(context) * 0.03,
        ),
        height: displayHeight(context) * 0.03,
        decoration: BoxDecoration(
            color: AppColors.blueColor,
            borderRadius: BorderRadius.all(
                Radius.circular(displayWidth(context) * 0.0346))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentPortfolio,
              style: AppTextStyle.whiteBoldSize28(context),
            ),
            UIHelper.verticalSpace16(context),
            Wrap(
              direction: Axis.vertical,
              // crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return PortfolioColumnTile(
                      symbol: model.details!.portfolio[index].symbol,
                      pricePershare: model.details!.portfolio[index].pricePerShare,
                      equityValue: model.details!.portfolio[index].equityValue,
                      totalQuantity: model.details!.portfolio[index].totalQuantity,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const VerticalDivider(
                      width:3
                    );
                  },
                  itemCount: model.details!.portfolio.length,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
