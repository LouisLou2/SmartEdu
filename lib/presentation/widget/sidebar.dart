import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_edu/entity/ui_tool/sidebar_data.dart';
import 'package:smart_edu/entity/ui_tool/sub_bar_tile.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/widget/const_widgets/custom_searchbar.dart';
import 'package:smart_edu/state/prov/sidebar_prov.dart';

import '../../entity/ui_tool/bar_tile.dart';
import '../../style/style_scheme.dart';
import 'icon_chequer.dart';

class Sidebar extends StatelessWidget {

  final SidebarData data;
  final TextEditingController controller;
  final String? searchHintText;
  final void Function(String)? searchOnChanged;
  final void Function(String)? searchOnSubmitted;

  const Sidebar({
    super.key,
    required this.data,
    required this.controller,
    this.searchHintText,
    this.searchOnChanged,
    this.searchOnSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final mtheme= context.theme;
    final barTiles = data.barTiles;
    return Drawer(
      elevation: 0,
      backgroundColor: mtheme.colorScheme.surfaceContainerHighest,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide.none,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 5.h,
                ),
                data.header,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 40.h,
                    ),
                    child: CustomSearchbar(
                      controller: controller,
                      hintText: searchHintText,
                      onChanged: searchOnChanged,
                      onSubmitted: searchOnSubmitted,
                    ),
                  ),
                ),
                SizedBox(width: 20.h,),
                ...List.generate(barTiles.length, (indexFisrt){
                  BarTile barTile = barTiles[indexFisrt];
                  if(barTile.subs==null){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: mtheme.colorScheme.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Selector<SidebarProv, int>(
                        selector: (context, prov)=>prov.selectedId,
                        builder: (context, id, child)=>ListTile(
                          minTileHeight: 0,
                          selected: id==barTile.id,
                          titleAlignment: ListTileTitleAlignment.center,
                          horizontalTitleGap: 6.w,
                          contentPadding: EdgeInsets.only(left: 8.w, right: 5.w, top: 5.h, bottom: 5.h),
                          selectedTileColor: context.theme.colorScheme.primary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          leading: barTile.icon!=null ? Icon(
                            barTile.icon,
                            size: 20.sp,
                          ):null,
                          title: Text(
                            barTile.title,
                            style: StyleScheme.cn_onSuf_500_LPN03(size: 15.sp),
                          ),
                          onTap: (){},
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                    child: ExpansionTile(
                      minTileHeight: 0,
                      onExpansionChanged: barTile.onExpand,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      title: Text(
                        barTile.title,
                        style: StyleScheme.cn_onSuf_500_LPN03(size: 15.sp),
                      ),
                      children: List.generate(barTile.subs!.length,
                        (indexSecond){
                          SubBarTile subBarTile = barTile.subs![indexSecond];
                          return Selector<SidebarProv, int>(
                              selector: (context, prov)=>prov.selectedId,
                              builder: (context, id, child){
                                return ListTile(
                                  minTileHeight: 0,
                                  selected: id==subBarTile.id,
                                  titleAlignment: ListTileTitleAlignment.center,
                                  horizontalTitleGap: 6.w,
                                  contentPadding: EdgeInsets.only(left: 8.w, right: 5.w, top: 5.h, bottom: 5.h),
                                  selectedTileColor: mtheme.colorScheme.primary,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  leading: subBarTile.icon!=null ? Icon(
                                    subBarTile.icon,
                                    size: 16.sp,
                                    color: mtheme.colorScheme.onPrimary,
                                  ):null,
                                  title: Text(
                                    subBarTile.title,
                                    style: StyleScheme.cn_onSuf_500_LPN03(size: 15.sp),
                                  ),
                                  onTap: subBarTile.onTap,
                                );
                              }
                            );
                        }
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.start,
              spacing: 20.w,
              children: [
                const IconChequer(icon: Icons.sunny, color: Colors.amber,),
                Icon(
                  Icons.notifications_active,
                  color: context.colorScheme.primary,
                  size: 30.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}