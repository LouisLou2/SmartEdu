import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/state/prov/user_prov.dart';

import '../../const/data_status.dart';
import '../../state/prov_manager.dart';
import '../../style/style_scheme.dart';
import '../widget/leading_title.dart';


class MyProfile extends StatefulWidget{
  final String? teacherId;
  const MyProfile({super.key, this.teacherId});

  @override
  State<StatefulWidget> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> with TickerProviderStateMixin{

  late final TabController _tabController;
  final uProv = ProvManager.userProv;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(uProv.status==DataStatus.failure){
        uProv.fetchStudent();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /*
  为什么这里的build方法不需要使用Selector来监视UserState?
  因为在main_dashboard.dart中已经在监视了，如果userStatus不对，就不会有这个界面的展示！
  * */
  @override
  Widget build(BuildContext context) {
    final stheme= ShadTheme.of(context);
    final mtheme= context.theme;
    return Expanded(
      child: Material(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.w,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 8.w,),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 35,
                            maxHeight: 35,
                          ),
                          child: IconButton.outlined(
                            color: context.theme.colorScheme.outline,
                            icon: Icon(
                              Icons.arrow_back,
                              size: 18.sp,
                            ),
                            style: IconButton.styleFrom(
                              side: BorderSide(
                                color: context.theme.colorScheme.outlineVariant,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(3.sp),
                            ),
                            onPressed: () {
                              //Navigator.of(context).pop();
                            },
                          ),
                        ),
                        SizedBox(width: 15.w,),
                        Text(
                          'CSU Infomation Portal',
                          style: TextStyle(
                            color: const Color(0xff005dad),
                            fontSize: 20.sp,
                            fontFamily: StyleScheme.engFontFamily,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        child: ListView(
                          children: [
                            SizedBox(height: 20.h,),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(uProv.student!.picUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color: context.theme.colorScheme.outlineVariant,
                                      width: 0.5,
                                    ),
                                  ),
                                  constraints: BoxConstraints(
                                    maxWidth: 140.w,
                                    maxHeight: 140.w,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h,),
                            Text(
                              uProv.student!.name,
                              style: TextStyle(
                                fontSize: 27.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                                fontFamily: StyleScheme.cnFontFamily,
                              ),
                            ),
                            Text(
                              uProv.student!.majorName,
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: context.theme.colorScheme.secondary,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5,
                                fontFamily: StyleScheme.engFontFamily,
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            LeadingTitle(
                              title: 'Info Detail',
                              fontSize: 20.sp,
                              titleColor: context.theme.colorScheme.onSurface,
                            ),
                            SizedBox(height: 20.h,),
                            GridView(
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 10,
                                childAspectRatio: 6,
                              ),
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LucideIcons.school,
                                      color: context.theme.colorScheme.outline,
                                    ),
                                    SizedBox(width: 5.w,),
                                    Text(
                                      'School',
                                      style: context.theme.textTheme.titleMedium?.copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: context.theme.colorScheme.outline,
                                        fontFamily: StyleScheme.engFontFamily,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  uProv.student!.schoolName,
                                  style: context.theme.textTheme.titleMedium?.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.5,
                                    wordSpacing: 1.5,
                                    fontFamily: StyleScheme.cnFontFamily,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.account_balance_sharp,
                                      color: context.theme.colorScheme.outline,
                                    ),
                                    SizedBox(width: 5.w,),
                                    Text(
                                      'Major',
                                      style: context.theme.textTheme.titleMedium?.copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.5,
                                        color: context.theme.colorScheme.outline,
                                        fontFamily: StyleScheme.engFontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  uProv.student!.majorName,
                                  style: StyleScheme.cn_onSuf_500_LPN03(
                                    size: 15.sp,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LucideIcons.house,
                                      color: context.theme.colorScheme.outline,
                                    ),
                                    SizedBox(width: 5.w,),
                                    Text(
                                      '年级',
                                      style: context.theme.textTheme.titleMedium?.copyWith(
                                        fontSize: 15.sp,
                                        letterSpacing: -0.5,
                                        fontWeight: FontWeight.w500,
                                        color: context.theme.colorScheme.outline,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  uProv.student!.gradeLevelStr,
                                  style: context.theme.textTheme.titleMedium?.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LucideIcons.timer,
                                      color: context.theme.colorScheme.outline,
                                    ),
                                    SizedBox(width: 5.w,),
                                    Text(
                                      'Phone',
                                      style: context.theme.textTheme.titleMedium?.copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: context.theme.colorScheme.outline,
                                        fontFamily: StyleScheme.engFontFamily,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  uProv.student!.phoneNumber,
                                  style: context.theme.textTheme.titleMedium?.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.5,
                                    fontFamily: StyleScheme.engFontFamily,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h,),
                            LeadingTitle(
                              title: 'Address',
                              fontSize: 20.sp,
                              titleColor: context.theme.colorScheme.onSurface,
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                              uProv.student!.address,
                              style: context.theme.textTheme.titleMedium?.copyWith(
                                fontSize: 15.sp,
                                color: context.theme.colorScheme.secondary,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5,
                                fontFamily: StyleScheme.engFontFamily,
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            LeadingTitle(
                              title: 'Identity Number',
                              fontSize: 20.sp,
                              titleColor: context.theme.colorScheme.onSurface,
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                              uProv.student!.identity,
                              style: context.theme.textTheme.titleMedium?.copyWith(
                                fontSize: 15.sp,
                                color: context.theme.colorScheme.secondary,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5,
                                fontFamily: StyleScheme.engFontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 15,
              child: Center(),
            ),
          ],
        ),
      ),
    );
  }
}