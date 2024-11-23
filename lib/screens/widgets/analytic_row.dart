import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/const_providers/color_provider.dart';
import 'package:real_estate/controllers/counter_cubit/cubit/counter_cubit.dart';
import 'package:real_estate/screens/widgets/animate_widget.dart';
import 'package:real_estate/screens/widgets/counter_widget.dart';
import 'package:real_estate/screens/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class AnalyticRow extends StatefulWidget {
  const AnalyticRow({super.key});

  @override
  State<AnalyticRow> createState() => _AnalyticRowState();
}

class _AnalyticRowState extends State<AnalyticRow> {
  @override
  Widget build(BuildContext context) {
    final double height = 20.h;
    final double width = 45.w;
    return Row(
      children: [
        Flexible(
          child: AnimateWidget(
            delayed: const Duration(seconds: 2),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              decoration: const BoxDecoration(
                  color: ColorProvider.primaryColor, shape: BoxShape.circle),
              height: height,
              width: width,
              child: _childItem(value: 1034, title: "BUY", subtitle: "offers"),
            ),
          ),
        ),
        Flexible(
          child: AnimateWidget(
            delayed: const Duration(seconds: 2),
            child: Card(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                decoration: BoxDecoration(
                    color: ColorProvider.whitishColor,
                    borderRadius: BorderRadius.circular(
                      3.w,
                    )),
                height: height,
                width: width,
                child: _childItem(
                  value: 2212,
                  title: "RENT",
                  subtitle: "offers",
                  color: ColorProvider.fadedTextColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _childItem(
      {required int value,
      required String title,
      required String subtitle,
      Color? color}) {
    Color textColor = color ?? Colors.white;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomText(
          text: title,
          textAlign: TextAlign.center,
          color: textColor,
        ),
        ListTile(
          title: BlocProvider(
            create: (context) => CounterCubit(),
            child: CounterWidget(value: value, textColor: textColor),
          ),
          subtitle: CustomText(
            text: subtitle,
            textAlign: TextAlign.center,
            color: textColor,
          ),
        ),
        Container(),
      ],
    );
  }
}
