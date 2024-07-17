import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/domain/entity/activity.dart';
import 'package:smart_edu/domain/entity/chart_data.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/widget/activity_tile.dart';
import 'package:smart_edu/presentation/widget/card_header.dart';
import 'package:smart_edu/presentation/widget/event_card.dart';
import 'package:smart_edu/presentation/widget/legend.dart';
import 'package:smart_edu/presentation/widget/num_stat_card.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/util/format_util.dart';
import 'package:time_planner/time_planner.dart';

import '../../../domain/entity/event.dart';

class AAOMainPanel extends StatefulWidget {
  const AAOMainPanel({super.key});

  @override
  State<StatefulWidget> createState() => _AAOMainPanelState();
}

class _AAOMainPanelState extends State<AAOMainPanel> {
  List<Color> creditColor = [
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.red
  ];
  List<Activity> activities = [
    Activity(eventId: 1, title: '培养方案变更提醒', time: DateTime.now()),
    Activity(eventId: 2, title: '2024年上学期教学评价', time: DateTime.now()),
    Activity(eventId: 3, title: '缓考申请启动', time: DateTime.now()),
    Activity(eventId: 4, title: '6月份出勤报表已生成', time: DateTime.now()),
  ];

  ChartData cdata = ChartData.term(
    year: 2024,
    term: TimeScale.TERM,
    xList: [2, 3, 4, 5, 6, 7, 8, 9, 10],
    yList: [0.94, 0.81, 0.85, 0.99, 0.86, 0.95, 0.99, 0.92, 0.86],
  );
  ChartData tdata = ChartData.term(
    year: 2024,
    term: TimeScale.TERM,
    xList: [2, 3, 4, 5, 6, 7, 8, 9, 10],
    yList: [0.95, 0.85, 0.86, 0.91, 0.99, 0.89, 0.99, 0.92, 0.81],
  );

  static const invoices = [
    (
      invoice: "INV001",
      paymentStatus: "Paid",
      totalAmount: r"$250.00",
      paymentMethod: "Credit Card",
    ),
    (
      invoice: "INV002",
      paymentStatus: "Pending",
      totalAmount: r"$150.00",
      paymentMethod: "PayPal",
    ),
    (
      invoice: "INV003",
      paymentStatus: "Unpaid",
      totalAmount: r"$350.00",
      paymentMethod: "Bank Transfer",
    ),
    (
      invoice: "INV004",
      paymentStatus: "Paid",
      totalAmount: r"$450.00",
      paymentMethod: "Credit Card",
    ),
    (
      invoice: "INV005",
      paymentStatus: "Paid",
      totalAmount: r"$550.00",
      paymentMethod: "PayPal",
    ),
    (
      invoice: "INV006",
      paymentStatus: "Pending",
      totalAmount: r"$200.00",
      paymentMethod: "Bank Transfer",
    ),
    (
      invoice: "INV007",
      paymentStatus: "Unpaid",
      totalAmount: r"$300.00",
      paymentMethod: "Credit Card",
    ),
  ];

  final pushNotifications = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final stheme = ShadTheme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 30.w, top: 25.h, right: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10.w,
                        children: [
                          Icon(
                            Icons.waving_hand,
                            size: 30.sp,
                            color: context.theme.colorScheme.primary,
                          ),
                          Text(
                            "Good Afternoon, ",
                            style: context.theme.textTheme.titleLarge?.copyWith(
                              letterSpacing: -0.5,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: StyleScheme.engFontFamily,
                            ),
                          ),
                          Text(
                            "卡洛琳",
                            style: context.theme.textTheme.titleLarge?.copyWith(
                              letterSpacing: -0.5,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              color: context.theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          backgroundColor: context.theme.colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          shadowColor: Colors.transparent,
                        ),
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: context.theme.colorScheme.onPrimary,
                              size: 20.sp,
                            ),
                            Text(
                              'More',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: context.theme.colorScheme.onPrimary,
                                fontFamily: StyleScheme.engFontFamily,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "School Overview",
                    style: context.theme.textTheme.titleLarge?.copyWith(
                      letterSpacing: -0.5,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: StyleScheme.engFontFamily,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: GridView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.h,
                            childAspectRatio: 1.8,
                          ),
                          children: [
                            NumStatCard(
                              title: '学生总数',
                              detailStr: '学生总数是很好的',
                              number: 1000,
                              color: context.theme.colorScheme.primary,
                              numFontSize: 30.sp,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 8.h),
                              onTap: () {},
                            ),
                            NumStatCard(
                              title: '老师总数',
                              detailStr: '老师总数是很好的',
                              number: 100,
                              color: context.theme.colorScheme.primary,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 8.h),
                              numFontSize: 30.sp,
                              onTap: () {},
                            ),
                            NumStatCard(
                              title: '课程总数',
                              detailStr: '课程总数是很好的',
                              number: 100,
                              color: context.theme.colorScheme.primary,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 8.h),
                              numFontSize: 30.sp,
                              onTap: () {},
                            ),
                            NumStatCard(
                              title: '教研组数',
                              detailStr: '教研组数是很好的',
                              number: 10,
                              color: context.theme.colorScheme.primary,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 8.h),
                              numFontSize: 30.sp,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        flex: 3,
                        child: AspectRatio(
                          aspectRatio: 1.8 * 3 / 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 20.h),
                              child: getRadialChart(
                                  [0.8, 0.5, 0.67, 0.25], creditColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Attendance Rate",
                        style: context.theme.textTheme.titleLarge?.copyWith(
                          letterSpacing: -0.5,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: StyleScheme.engFontFamily,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          backgroundColor:
                              context.theme.colorScheme.secondaryContainer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          shadowColor: Colors.transparent,
                        ),
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              'See Detail',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: context.theme.colorScheme.primary,
                                fontFamily: StyleScheme.engFontFamily,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: context.theme.colorScheme.primary,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.h),
                            decoration: BoxDecoration(
                              color: context.theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                getChart(cdata, tdata),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        flex: 2,
                        child: AspectRatio(
                          aspectRatio: 1.5 * 2 / 5,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.h),
                            decoration: BoxDecoration(
                              color: context.theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Most Attentive',
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    letterSpacing: -0.3,
                                    color: context.theme.colorScheme.primary,
                                    fontFamily: StyleScheme.engFontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    children: List.generate(
                                      5,
                                      (index) => ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: CircleAvatar(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(
                                                'assets/image/aao_admin.png'),
                                          ),
                                        ),
                                        title: Text(
                                          '卡洛琳',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: context
                                                .theme.colorScheme.secondary,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '中南大学教务处',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: context
                                                .theme.colorScheme.onSurface
                                                .withOpacity(0.6),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transactions",
                        style: context.theme.textTheme.titleLarge?.copyWith(
                          letterSpacing: -0.5,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: StyleScheme.engFontFamily,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          backgroundColor:
                              context.theme.colorScheme.secondaryContainer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          shadowColor: Colors.transparent,
                        ),
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              'See Detail',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: context.theme.colorScheme.primary,
                                fontFamily: StyleScheme.engFontFamily,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: context.theme.colorScheme.primary,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 550.h,
                    ),
                    child: ShadTable.list(
                      header: const [
                        ShadTableCell.header(child: Text('Invoice')),
                        ShadTableCell.header(child: Text('Status')),
                        ShadTableCell.header(child: Text('Method')),
                        ShadTableCell.header(
                          alignment: Alignment.centerRight,
                          child: Text('Amount'),
                        ),
                      ],
                      footer: const [
                        ShadTableCell.footer(child: Text('Total')),
                        ShadTableCell.footer(child: Text('')),
                        ShadTableCell.footer(child: Text('')),
                        ShadTableCell.footer(
                          alignment: Alignment.centerRight,
                          child: Text(r'$2500.00'),
                        ),
                      ],
                      columnSpanExtent: (index) {
                        if (index == 2) return const FixedTableSpanExtent(130);
                        if (index == 3) {
                          return const MaxTableSpanExtent(
                            FixedTableSpanExtent(120),
                            RemainingTableSpanExtent(),
                          );
                        }
                        // uses the default value
                        return null;
                      },
                      children: invoices.map(
                        (invoice) => [
                          ShadTableCell(
                            child: Text(
                              invoice.invoice,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ShadTableCell(child: Text(invoice.paymentStatus)),
                          ShadTableCell(child: Text(invoice.paymentMethod)),
                          ShadTableCell(
                            alignment: Alignment.centerRight,
                            child: Text(
                              invoice.totalAmount,
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
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 300.w,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 22.sp,
                                letterSpacing: -0.3,
                                color: context.theme.colorScheme.primary,
                                fontFamily: StyleScheme.engFontFamily,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 1.h),
                                backgroundColor: context
                                    .theme.colorScheme.secondaryContainer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                shadowColor: Colors.transparent,
                              ),
                              child: Wrap(
                                runAlignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    'See Detail',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: context.theme.colorScheme.primary,
                                      fontFamily: StyleScheme.engFontFamily,
                                      letterSpacing: -0.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: context.theme.colorScheme.primary,
                                    size: 16.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: context.theme.colorScheme.primary,
                              width: 2.sp,
                            ),
                            image: const DecorationImage(
                              image: AssetImage('assets/image/aao_admin.png'),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: context.theme.colorScheme.primary
                                    .withOpacity(0.4),
                                blurRadius: 5.sp,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          constraints: BoxConstraints(
                            maxWidth: 100.w,
                            maxHeight: 100.w,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          '卡洛琳',
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          '中南大学教务处',
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Wrap(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 1,
                                ),
                                shape: const CircleBorder(),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 22.sp,
                                color:
                                    context.theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 1,
                                ),
                                shape: const CircleBorder(),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 22.sp,
                                color:
                                    context.theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 1,
                                ),
                                shape: const CircleBorder(),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                              ),
                              child: Icon(
                                Icons.notifications_active,
                                size: 22.sp,
                                color:
                                    context.theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Coming Events',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontFamily: StyleScheme.engFontFamily,
                      fontWeight: FontWeight.w700,
                      color: context.theme.colorScheme.primary,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 18.h),
                    decoration: BoxDecoration(
                      borderRadius: stheme.radius,
                      border: Border.all(color: stheme.colorScheme.border),
                      color: context.theme.colorScheme.surface,
                    ),
                    child: Row(
                      children: [
                        ShadImage.square(
                          LucideIcons.bellRing,
                          size: 24,
                          color: stheme.colorScheme.foreground,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Push Notifications',
                                  style: stheme.textTheme.small,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Send notifications to device.',
                                  style: stheme.textTheme.muted,
                                )
                              ],
                            ),
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: pushNotifications,
                          builder: (context, value, child) {
                            return ShadSwitch(
                              value: value,
                              onChanged: (v) => pushNotifications.value = v,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EventCard(
                    event: Event(
                      id: 1,
                      type: 'Event',
                      title: '培养方案变更提醒',
                      time: DateTime.now(),
                      shortDesc: '培养方案变更提醒,培养方案变更提醒,培养方案变更提醒',
                    ),
                    color: context.theme.colorScheme.surface,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    onTap: (event) {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EventCard(
                    event: Event(
                      id: 1,
                      type: 'Event',
                      title: '培养方案变更提醒',
                      time: DateTime.now(),
                      shortDesc: '培养方案变更提醒,培养方案变更提醒,培养方案变更提醒',
                    ),
                    color: context.theme.colorScheme.surface,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    onTap: (event) {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 固定是四个value
  Widget getRadialChart(List<double> values, List<Color> colors) {
    int len = values.length;
    double radius = 30.w;
    double lineW = 12.w;
    Color backColor = context.theme.colorScheme.primary.withOpacity(0.2);
    CircularPercentIndicator indicator = CircularPercentIndicator(
      radius: radius,
      lineWidth: lineW,
      circularStrokeCap: CircularStrokeCap.round,
      percent: values[len - 1],
      progressColor: colors[len - 1],
      backgroundColor: backColor,
      animation: true,
      animationDuration: 400,
    );
    for (int i = values.length - 2; i >= 0; --i) {
      radius += 18.w;
      indicator = CircularPercentIndicator(
        radius: radius,
        lineWidth: lineW,
        circularStrokeCap: CircularStrokeCap.round,
        percent: values[i],
        center: indicator,
        progressColor: colors[i],
        backgroundColor: backColor,
        animation: true,
        animationDuration: 400,
      );
    }
    return indicator;
  }

  Widget getChart(ChartData cdata, ChartData ddata) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        LineChartData(
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(
                color: context.theme.colorScheme.primary.withOpacity(0.3),
                width: 1.sp,
              ),
              left: BorderSide(
                color: context.theme.colorScheme.primary.withOpacity(0.3),
                width: 1.sp,
              ),
              right: BorderSide.none,
              top: BorderSide.none,
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              curveSmoothness: 0.4,
              barWidth: 4.sp,
              spots: List.generate(
                cdata.xList.length,
                (index) => FlSpot(
                  cdata.xList[index].toDouble(),
                  cdata.yList[index],
                ),
              ),
              gradient: const LinearGradient(
                colors: [Colors.indigoAccent, Colors.blue, Colors.green],
              ),
              isCurved: true,
              isStrokeCapRound: true,
              isStrokeJoinRound: true,
              preventCurveOverShooting: true,
              shadow: Shadow(
                color: context.theme.colorScheme.primary.withOpacity(0.3),
                blurRadius: 5,
              ),
            ),
            LineChartBarData(
              curveSmoothness: 0.4,
              barWidth: 4.sp,
              spots: List.generate(
                ddata.xList.length,
                (index) => FlSpot(
                  ddata.xList[index].toDouble(),
                  ddata.yList[index],
                ),
              ),
              gradient: const LinearGradient(
                colors: [Colors.amber, Colors.deepOrange, Colors.red],
              ),
              isCurved: true,
              isStrokeCapRound: true,
              isStrokeJoinRound: true,
              preventCurveOverShooting: true,
              shadow: Shadow(
                color: context.theme.colorScheme.primary.withOpacity(0.3),
                blurRadius: 5,
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (LineBarSpot touchedSpot) {
                return context.theme.colorScheme.primary;
              },
              getTooltipItems: (List<LineBarSpot> touchedSpots) {
                return touchedSpots.map((LineBarSpot touchedSpot) {
                  return LineTooltipItem(
                    FormatUtil.doubleToStr(touchedSpot.y),
                    TextStyle(
                      color: context.theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                      fontFamily: StyleScheme.engFontFamily,
                      fontSize: 12.sp,
                    ),
                  );
                }).toList();
              },
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            horizontalInterval: 0.1,
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) => FlLine(
              color: context.theme.colorScheme.primary.withOpacity(0.3),
              strokeWidth: 1.sp,
            ),
            getDrawingVerticalLine: (value) => FlLine(
              color: context.theme.colorScheme.primary.withOpacity(0.3),
              strokeWidth: 1.sp,
            ),
          ),
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 0.1,
                getTitlesWidget: (value, meta) {
                  return Text(
                    FormatUtil.doubleToStr(value),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: StyleScheme.engFontFamily,
                      color:
                          context.theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Text(
                      'Jan',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: StyleScheme.engFontFamily,
                        color: context.theme.colorScheme.onSurface
                            .withOpacity(0.6),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
