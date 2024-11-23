import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:real_estate/controllers/counter_cubit/cubit/counter_cubit.dart';
import 'package:sizer/sizer.dart';

// import 'custom_text.dart';

class CounterWidget extends StatefulWidget {
  final int value;
  final Color textColor;
  const CounterWidget(
      {required this.value, required this.textColor, super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  void initState() {
    // _doCounting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Countup(
        textAlign: TextAlign.center,
        begin: 0,
        end: widget.value.toDouble(),
        duration: const Duration(seconds: 4),
        separator: ' ',
        style: GoogleFonts.poppins(
          fontSize: 25.sp,
          fontWeight: FontWeight.w600,
          color: widget.textColor,
        ));
    // return BlocBuilder<CounterCubit, CounterState>(
    //   buildWhen: (previous, current) {
    //     return previous.count != current.count;
    //   },
    //   builder: (context, state) {
    //     return CustomText(
    //       text: "${state.count}",
    //       textAlign: TextAlign.center,
    //       fontSize: 25.sp,
    //       fontWeight: FontWeight.w600,
    //       color: widget.textColor,
    //     );
    //   },
    // );
  }

  // void _doCounting() {
  //   BlocProvider.of<CounterCubit>(context).doCount(widget.value);
  // }
}
