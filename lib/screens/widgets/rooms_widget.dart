import 'package:flutter/material.dart';
import 'package:real_estate/const_providers/asset_image_provider.dart';
import 'package:real_estate/screens/widgets/interior_widget.dart';
import 'package:sizer/sizer.dart';

class RoomsWidget extends StatelessWidget {
  const RoomsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(7.w),
      child: Container(
        height: 50.h,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7.w)),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
                child: InteriorWidget(
              assetImage: AssetImageProvider.interiorImage2,
              label: "Gladkoval St, 25",
            )),
            Flexible(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                    child: InteriorWidget(
                  assetImage: AssetImageProvider.interiorImage1,
                  label: "Teefekk St, 43",
                  isLarger: false,
                )),
                Flexible(
                    child: InteriorWidget(
                  assetImage: AssetImageProvider.interiorImage3,
                  label: "Telebelo St, 22",
                  isLarger: false,
                )),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
