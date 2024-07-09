import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/anim_sidebar.dart';
import 'package:smart_edu/presentation/page/course_sched.dart';
import 'package:smart_edu/presentation/page/main_panel.dart';
import 'package:smart_edu/presentation/widget/icon_chequer.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/try/side_bar.dart';

import '../state/page_prov.dart';

class MainDashboard extends StatefulWidget{
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard>{

  Widget getThemeWidget(ThemeMode mode){
    IconData data;
    String text = StyleScheme.getThemeText(mode);
    switch (mode) {
      case ThemeMode.light:
        data = Icons.sunny;
        break;
      case ThemeMode.dark:
        data = Icons.nightlight_round;
        break;
      case ThemeMode.system:
        data = Icons.auto_awesome;
        break;
    }
    return Wrap(
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10.w,
      children: [
        Icon(
          data,
          size: 20.sp,
        ),
        Text(
          text,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: context.theme.colorScheme.onInverseSurface,
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.surface,
        toolbarHeight: 60.h,
        leadingWidth: 400.w,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            spacing: 10.w,
            children: [
              Icon(
                Icons.menu,
                size: 25.sp,
              ),
              SizedBox(width: 20.w,),
              Image.asset(
                'assets/image/flutter_icon.png',
                fit: BoxFit.cover,
                width: 25.sp,
              ),
              Text(
                'CSU Academy',
                style: context.theme.textTheme.titleLarge?.copyWith(
                  letterSpacing: -0.7,
                  fontWeight: FontWeight.w500,
                  fontFamily: StyleScheme.engFontFamily,
                  color: context.theme.colorScheme.primary,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        centerTitle: false,
        title: SearchAnchor(
          builder: (context, controller){
            return SearchBar(
              hintText: '搜索功能',
              constraints: BoxConstraints(
                maxHeight: 40.h,
                maxWidth: 600.w,
                minHeight: 30.h,
              ),
              elevation: const WidgetStatePropertyAll<double>(0.5),
              backgroundColor: WidgetStatePropertyAll<Color>(context.theme.colorScheme.onInverseSurface),
              surfaceTintColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
              controller: controller,
              padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.w)),
              onTap: ()=>controller.openView(),
              onChanged: (_)=>controller.openView(),
              leading: const Icon(Icons.search),
              trailing: [
                Tooltip(
                  message: 'Clear Text',
                  child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ],
            );
          },
          suggestionsBuilder: (BuildContext context, SearchController controller) {
            return List.generate(5, (index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  controller.closeView(item);
                },
              );
            });
          },
        ),
        actions: [
          ShadSelect<ThemeMode>(
            placeholder: const Text('选择主题'),
            options: [
              Text(
                'Theme',
                style: context.theme.textTheme.titleMedium?.copyWith(fontFamily: StyleScheme.engFontFamily),
              ),
              ShadOption(value: ThemeMode.light, child: getThemeWidget(ThemeMode.light),),
              ShadOption(value: ThemeMode.dark, child: getThemeWidget(ThemeMode.dark),),
              ShadOption(value: ThemeMode.system, child: getThemeWidget(ThemeMode.system),),
            ],
            onChanged: (value) {},
            selectedOptionBuilder: (BuildContext context, ThemeMode? value) {
              return value==null?const Text('选择主题'):getThemeWidget(value);
            },
          ),
          SizedBox(width: 20.w,),
          const IconChequer(icon: Icons.notifications_none_outlined,color: Colors.amber,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: CircleAvatar(
              radius: 20.sp,
              child: const Text(
                '娄',
              ),
            ),
          ),
          SizedBox(width: 10.w,)
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            useIndicator: true,
            backgroundColor: context.theme.colorScheme.surface,
            labelType: NavigationRailLabelType.all,
            selectedIndex: 0,
            onDestinationSelected: (index) {
              print('@@@@@@@@@@@@index: $index');
              ProvManager.pageProv.setPage(index);
            },
            destinations: [
              getNavRailEntry(Icons.home, '主页'),
              getNavRailEntry(CupertinoIcons.profile_circled, '学籍'),
              getNavRailEntry(Icons.book_outlined, '选课'),
              getNavRailEntry(Icons.grade, '成绩'),
              getNavRailEntry(Icons.stacked_line_chart, '培养管理'),
              getNavRailEntry(CupertinoIcons.pencil_circle, '我的考试'),
              getNavRailEntry(Icons.rate_review_outlined, '教学评价'),
              getNavRailEntry(Icons.school_outlined, '毕业设计'),
            ],
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Selector<PageProv, int>(
            selector: (context, prov) => prov.page,
            shouldRebuild: (prev, next) => prev != next,
            builder: (context, pageIndex, child) {
              switch (pageIndex) {
                case 0:
                  return const MainPanel();
                case 1:
                  return const Center();
                case 2:
                  return const CourseSched();
                case 3:
                  return const Expanded(child:NavigationSide());
                case 4:
                  return const MainPanel();
                case 5:
                  return const MainPanel();
                case 6:
                  return const MainPanel();
                case 7:
                  return const MainPanel();
                default:
                  return const MainPanel();
              }
            },
          ),
        ],
      ),
    );
  }
  NavigationRailDestination getNavRailEntry(IconData data, String label){
    return NavigationRailDestination(
      icon: Icon(data),
      selectedIcon: Icon(data, color: context.theme.colorScheme.primary),
      label: Text(
        label,
        style: context.theme.textTheme.titleSmall?.copyWith(letterSpacing: -0.5),
      ),
    );
  }
}