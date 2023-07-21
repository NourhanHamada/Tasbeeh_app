import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasbeeh/constants/my_colors.dart';
import 'package:tasbeeh/view_model/cubit/azkar_details_card_cubit/azkar_details_card_cubit.dart';
import 'package:tasbeeh/view_model/cubit/azkar_details_cubit/azkar_details_cubit.dart';
import 'package:tasbeeh/view_model/cubit/theme_cubit/theme_cubit.dart';

class AzkarDetailsCard extends StatelessWidget {
  const AzkarDetailsCard({
    Key? key,
    this.length,
    this.repeat,
    this.zekr,
  }) : super(key: key);

  final length;
  final repeat;
  final zekr;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AzkarDetailsCardCubit, AzkarDetailsCardState>(
      listener: (context, state) {},
      builder: (context, state) {
        AzkarDetailsCardCubit cubit = AzkarDetailsCardCubit.get(context);
        return BlocConsumer<AzkarDetailsCubit, AzkarDetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: AzkarDetailsCubit.morningList.length,
                itemBuilder: (context, index) {
                  bool isVisible = cubit.isVisibleList[index];
                  return Visibility(
                    visible: isVisible,
                    child: GestureDetector(
                      onTap: () {
                        cubit.cardUnVisible(index, !isVisible);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Card(
                          color: ThemeCubit.get(context).isDark ? MyColors.dark : MyColors.white,
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: MyColors.mainColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      child: Text(
                                        '${AzkarDetailsCubit.morningList[index]['repeat']}',
                                        style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: MyColors.white
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 120,
                                  child: Text(
                                    '${AzkarDetailsCubit.morningList[index]['zekr']}',
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.cairo(
                                        textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                     color: ThemeCubit.get(context).isDark ? MyColors.white : MyColors.black
                                        ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
