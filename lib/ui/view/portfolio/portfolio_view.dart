import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:trove_app_challenge/ui/shared/widgets/long_button.dart';
import 'package:trove_app_challenge/ui/view/portfolio/portfolio_viewmodel.dart';
import 'package:trove_app_challenge/ui/view/portfolio/widgets/custom_portfolio_column_tile.dart';
import 'package:trove_app_challenge/utilities/constants/app_strings.dart';
import 'package:trove_app_challenge/utilities/constants/colors.dart';
import 'package:trove_app_challenge/utilities/constants/sizes_helpers.dart';
import 'package:trove_app_challenge/utilities/constants/text_styles.dart';
import 'package:trove_app_challenge/utilities/constants/ui_helpers.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'stockSearch'),
  ],
)
class PortfolioView extends StatelessWidget {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PortfolioViewModel>.reactive(
      onModelReady: (model) async {
        await model.getDetails();
      },
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   iconTheme: const IconThemeData(color: AppColors.blackColor),
        //   backgroundColor: AppColors.whiteColor,
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: displayHeight(context),
              width: displayWidth(context),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  displayWidth(context) * 0.0506,
                  displayHeight(context) * 0.0226,
                  displayWidth(context) * 0.0506,
                  displayHeight(context) * 0.0226,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        myAsset,
                        style: AppTextStyle.darkGreyBoldSize20(context),
                      ),
                    ),
                    UIHelper.verticalSpace24(context),
                    Text(
                      totalAsset,
                      style: AppTextStyle.darkGreyNormalSize16(context),
                      // textAlign: TextAlign.center,
                    ),
                    UIHelper.verticalSpace10(context),
                    Row(
                      children: [
                        Text(
                          '\$ ${model.totalEquityValue}',
                          style: AppTextStyle.darkGreyBoldSize32(context),
                        ),
                        const Icon(
                          Icons.arrow_upward_outlined,
                          color: AppColors.green,
                          size: 20,
                        )
                      ],
                    ),
                    UIHelper.verticalSpace40(context),
                    // const CustomTextField(
                    //   hintText: typeSearchStock,
                    //   inputAction: TextInputAction.search,
                    //   keyboardType: TextInputType.text,
                    //   obscureText: false,
                    //   autoCorrect: true,
                    // ),
                    // UIHelper.verticalSpace10(context),

                    InkWell(
                      child: Text(
                        myPortfolio,
                        style: AppTextStyle.darkGreyBoldSize20(context),
                      ),
                      onTap: model.check,
                    ),
                    UIHelper.verticalSpace10(context),
                    model.checkPortfolio == true
                        ? ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, index) {
                              return InkWell(
                                onTap: () {},
                                child: PortfolioColumnTile(
                                  symbol:
                                      model.details!.portfolio[index].symbol,
                                  pricePershare: model
                                      .details!.portfolio[index].pricePerShare,
                                  equityValue: model
                                      .details!.portfolio[index].equityValue,
                                  totalQuantity: model
                                      .details!.portfolio[index].totalQuantity,
                                  color: model.portfolioColors[index],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return UIHelper.verticalSpace10(context);
                            },
                            itemCount: model.details!.portfolio.length,
                          )
                        : Container(),
                    // UIHelper.verticalSpace16(context),
                    Column(
                      children: [
                        const Text('Portfolio Performance'),
                        const Text(
                            'YTD metrics not available for manual Portfolio entries,'),
                        const Text('Net Account Value'),
                        const Text('\$11,064.44'),
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(),
                                const VerticalDivider(),
                                Column(),
                                const VerticalDivider(),
                                Column()
                              ],
                            ),
                            Row(
                              children: [
                                Column(),
                                const VerticalDivider(),
                                Column(),
                                const VerticalDivider(),
                                Column()
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    LongButton(onPressed: () {}, label: 'Take a loan')
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => PortfolioViewModel(),
    );
  }
}
