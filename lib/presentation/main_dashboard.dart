import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/page/admin_page/aao_admin_dash.dart';
import 'package:smart_edu/presentation/page/admin_page/aao_main_panel.dart';
import 'package:smart_edu/presentation/page/admin_page/classroom_application_fun/application_board.dart';
import 'package:smart_edu/presentation/page/admin_page/statistic_show_fun/statistic_show.dart';
import 'package:smart_edu/presentation/page/main_panel.dart';
// import 'package:smart_edu/presentation/teacher_page/classroom_page/classroom_application.dart';
import 'package:smart_edu/presentation/page/tea_page/classroom_apply_fun/classroom_apply_page.dart';
import 'package:smart_edu/presentation/page/tea_page/proctored_exam_fun/proctored_exam_page.dart';

import 'package:smart_edu/presentation/page/tea_page/fault_report_fun/fault_report_page.dart';
import 'package:smart_edu/state/page_prov.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/style/style_scheme.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key, required this.subWidget});

  final Widget subWidget;
  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  final PageProv pageProv = ProvManager.pageProv;
  @override
  void initState() {
    super.initState();
  }

  Widget getThemeWidget(ThemeMode mode) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.onInverseSurface,
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.surface,
        toolbarHeight: 85.h,
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
                size: 32.sp,
              ),
              SizedBox(
                width: 20.w,
              ),
              Image.asset(
                'assets/image/flutter_icon.png',
                fit: BoxFit.cover,
                width: 30.w,
              ),
              Text(
                'CSU Academy',
                style: context.theme.textTheme.titleLarge?.copyWith(
                  letterSpacing: -0.7,
                  fontWeight: FontWeight.w500,
                  fontFamily: StyleScheme.engFontFamily,
                  color: context.theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        centerTitle: false,
        title: SearchAnchor(
          builder: (context, controller) {
            return SearchBar(
              hintText: '搜索功能',
              constraints: BoxConstraints(
                maxHeight: 600.h,
                minHeight: 50.h,
              ),
              elevation: const WidgetStatePropertyAll<double>(0.5),
              backgroundColor: WidgetStatePropertyAll<Color>(
                  context.theme.colorScheme.onInverseSurface),
              surfaceTintColor:
                  const WidgetStatePropertyAll<Color>(Colors.transparent),
              controller: controller,
              padding: WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.w)),
              onTap: () => controller.openView(),
              onChanged: (_) => controller.openView(),
              leading: const Icon(Icons.search),
              trailing: [
                Tooltip(
                  message: 'Clear Text',
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ],
            );
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
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
                style: context.theme.textTheme.titleMedium
                    ?.copyWith(fontFamily: StyleScheme.engFontFamily),
              ),
              ShadOption(
                value: ThemeMode.light,
                child: getThemeWidget(ThemeMode.light),
              ),
              ShadOption(
                value: ThemeMode.dark,
                child: getThemeWidget(ThemeMode.dark),
              ),
              ShadOption(
                value: ThemeMode.system,
                child: getThemeWidget(ThemeMode.system),
              ),
            ],
            onChanged: (value) {},
            selectedOptionBuilder: (BuildContext context, ThemeMode? value) {
              return value == null ? const Text('选择主题') : getThemeWidget(value);
            },
          ),
          SizedBox(
            width: 20.w,
          ),
          const Icon(
            Icons.notifications_active_outlined,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: const CircleAvatar(
              child: Text(
                '管',
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          )
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
              pageProv.setPage(2, index);

            },
            destinations: [
              getNavRailEntry(Icons.home, '主页'),
              getNavRailEntry(Icons.data_array, '统计'),
              getNavRailEntry(Icons.check, '审核'),
            ],
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),

          Expanded(child: Selector<PageProv,int>(
            selector: (context, prov) => prov.page[2],
            shouldRebuild: (pre,next)=>pre!=next,
            builder:(context,pageNum,_){
              switch (pageNum) {
                case 0:
                  return const AAOMainPanel();
                case 1:
                  return const StatisticShow();
                case 2:
                  return const ApplicationBoard();
                case 3:
                  return ProctoredExamPage();
                case 4:
                  return const ClassroomApplyPage();
                case 5:
                  return const FaultReportPage();
                case 6:
                  return const FaultReportPage();
                default:
                  return const AAOMainPanel();
              }
            }),)

        ],
      ),
    );
  }

  NavigationRailDestination getNavRailEntry(IconData data, String label) {
    return NavigationRailDestination(
      icon: Icon(data),
      selectedIcon: Icon(data, color: context.theme.colorScheme.primary),
      label: Text(
        label,
        style:
            context.theme.textTheme.titleSmall?.copyWith(letterSpacing: -0.5),
      ),
    );
  }
}
