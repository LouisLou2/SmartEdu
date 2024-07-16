import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/entity/chapter1.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/widget/leading_title.dart';
import 'package:smart_edu/style/style_scheme.dart';

import '../../widget/legend.dart';


class TeacherIntro extends StatefulWidget{
  const TeacherIntro({super.key});

  @override
  State<StatefulWidget> createState() => _TeacherIntroState();
}

class _TeacherIntroState extends State<TeacherIntro> with TickerProviderStateMixin{

  late final TabController _tabController;
  late final List<Chapter1> _data;
  late final List<bool> expanded;
  List<Color> creditColor=[Colors.green, Colors.blue, Colors.orange, Colors.red];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final stheme= ShadTheme.of(context);
    final mtheme= context.theme;
    return Material(
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
                          onPressed: () {},
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
                                  image: const DecorationImage(
                                    image: AssetImage('assets/image/stu.png'),
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
                            'Caroline Polachek',
                            style: TextStyle(
                              fontSize: 27.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.5,
                              fontFamily: StyleScheme.engFontFamily,
                            ),
                          ),
                          Text(
                            'Assistant Professor',
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
                                '计算机学院',
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
                                '计算机科学与技术',
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
                                    '学历',
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
                                '博士',
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
                                    'Email',
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
                                'shushuyule@gmail.com',
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
                            'No. 1, South Daxue Road, Changsha, Hunan, China',
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
                            title: 'Research Focus',
                            fontSize: 20.sp,
                            titleColor: context.theme.colorScheme.onSurface,
                          ),
                          SizedBox(height: 10.h,),
                          Text(
                            'Computer Network, Data Mining, Machine Learning, Artificial Intelligence',
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
          Expanded(
            flex: 15,
            child: Padding(
              padding: EdgeInsets.only(left: 5.w, top: 10.h),
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  border: Border.all(
                    color: context.theme.colorScheme.outlineVariant,
                    width: 0.5,
                  ),
                ),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 15.w,),
                          Text(
                            'Detailed Information',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.5,
                              fontFamily: StyleScheme.engFontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: context.theme.colorScheme.outlineVariant,
                      thickness: 0.5,
                      height: 0.5.h,
                    ),
                    TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      controller: _tabController,
                      indicatorPadding: const EdgeInsets.symmetric(vertical: 0),
                      indicatorColor: context.theme.colorScheme.onSurface,
                      unselectedLabelStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: StyleScheme.engFontFamily,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: StyleScheme.engFontFamily,
                        color: context.theme.colorScheme.onSurface,
                      ),
                      unselectedLabelColor: context.theme.colorScheme.outline.withOpacity(0.9),
                      tabs: const [
                        Tab(
                          text: 'Main',
                        ),
                        Tab(
                          text: 'Research Papers',
                        ),
                        Tab(
                          text: 'Publications',
                        ),
                        Tab(
                          text: 'Patents',
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height-130.h,
                      ),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LeadingTitle(
                                    title: 'Teacher Description',
                                    fontSize: 20.sp,
                                    titleColor: context.theme.colorScheme.onSurface,
                                  ),
                                  SizedBox(height: 15.h,),
                                  Text(
                                    """陈志刚，男，博士，现为中南大学计算机学院教授，博士生导师、享受国务院“政府特殊津贴”专家；高校计算机专业优秀教师；湖南省芙蓉教学名师；教育部软件工程专业教学指导委员会秘书长；入选美国斯坦福大学全球2%顶尖科学家榜单；中国工程教育认证专家；湖南省计算机学会副理事长；湖南省通信学会副理事长，示范性软件学院联盟研究生教育委员会常委会常委、“信创人才产教融合共建计划”智库专家。
主要研究方向是智能无线网络与协同计算、网络与分布式计算、移动医疗、物联网。主讲本科生和研究生的《编译原理》、《分布式系统》、《人工智能原理》等课程，是国家精品课、国家级一流课程主讲教师，获国家级教学成果奖1项、省级教学成果奖5项。
主持和参加包括科技创新2030—“新一代人工智能”重大项目、国家自然科学基金、国家863计划课题、国家自然科学基金委员会与韩国国家研究基金会联合资助合作项目、教育部优先发展领域课题、教育部重点科研计划项目、信息产业科研试制项目、国防科技重点实验室基金项目、高等学校青年骨干教师资助计划、国家留学回国人员基金、湖南省自然科学基金、湖南省学科带头人资助计划等等纵横向科研项目40余项，具有优秀的科研团队和丰富的工程实践经验。长期从事无线传感器网络、分布式计算等方面的研究工作，在国内外建立了良好的学术关系。近年已发表科研论文300余篇，获省部级科技奖励8项，授权国家发明专利10余项，软件著作权10余个，主编专著教材10余本，主审教材2部。""",
                                    style: context.theme.textTheme.titleMedium?.copyWith(
                                      fontSize: 15.sp,
                                      color: context.theme.colorScheme.secondary,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.5,
                                      fontFamily: StyleScheme.cnFontFamily,
                                    ),
                                    strutStyle: const StrutStyle(
                                      height: 1.5,
                                    ),
                                  ),
                                  SizedBox(height: 25.h,),
                                  LeadingTitle(
                                    title: 'Education Experience',
                                    fontSize: 20.sp,
                                    titleColor: context.theme.colorScheme.onSurface,
                                  ),
                                  SizedBox(height: 15.h,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            child: Icon(
                                              LucideIcons.school,
                                              color: context.theme.colorScheme.primary,
                                            ),
                                          ),
                                          SizedBox(width: 20.w,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Ph.D. in Computer Science',
                                                style: context.theme.textTheme.titleMedium?.copyWith(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: context.theme.colorScheme.onSurface,
                                                  fontFamily: StyleScheme.engFontFamily,
                                                  letterSpacing: -0.5,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Stanford University  |  2004.4 - 2005.6',
                                                    style: context.theme.textTheme.titleMedium?.copyWith(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w500,
                                                      color: context.theme.colorScheme.secondary,
                                                      fontFamily: StyleScheme.engFontFamily,
                                                      letterSpacing: -0.5,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minHeight: 30.h,
                                        ),
                                        child: IntrinsicHeight(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 15.w),
                                            child: VerticalDivider(
                                              color: context.theme.colorScheme.outlineVariant,
                                              thickness: 2,
                                              width: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            child: Icon(
                                              LucideIcons.school,
                                              color: context.theme.colorScheme.primary,
                                            ),
                                          ),
                                          SizedBox(width: 20.w,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Ph.D. in Computer Science',
                                                style: context.theme.textTheme.titleMedium?.copyWith(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: context.theme.colorScheme.onSurface,
                                                  fontFamily: StyleScheme.engFontFamily,
                                                  letterSpacing: -0.5,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Stanford University  |  2004.4 - 2005.6',
                                                    style: context.theme.textTheme.titleMedium?.copyWith(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w500,
                                                      color: context.theme.colorScheme.secondary,
                                                      fontFamily: StyleScheme.engFontFamily,
                                                      letterSpacing: -0.5,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: ListView(
                              children: [
                                SizedBox(height: 20.h,),
                                LeadingTitle(
                                  title: 'Research Papers',
                                  fontSize: 20.sp,
                                  titleColor: context.theme.colorScheme.onSurface,
                                ),
                                SizedBox(height: 15.h,),
                                ...List.generate(20, (index) => Column(
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                        'A Novel Approach to Network Security',
                                        style: context.theme.textTheme.titleMedium?.copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: context.theme.colorScheme.onSurface,
                                          fontFamily: StyleScheme.engFontFamily,
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'IEEE Transactions on Network Security',
                                        style: context.theme.textTheme.titleMedium?.copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: context.theme.colorScheme.secondary,
                                          fontFamily: StyleScheme.engFontFamily,
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                      trailing: Text(
                                        '2021.6',
                                        style: context.theme.textTheme.titleMedium?.copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: context.theme.colorScheme.secondary,
                                          fontFamily: StyleScheme.engFontFamily,
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: context.theme.colorScheme.outlineVariant,
                                      thickness: 0.5,
                                      height: 0.5.h,
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                          Text('Elective Course'),
                          Text('Elective Course'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 固定是四个value
  Widget getRadialChart(List<double> values, List<Color> colors){
    int len = values.length;
    double radius = 30.w;
    double lineW = 12.w;
    Color backColor =  context.theme.colorScheme.primary.withOpacity(0.2);
    CircularPercentIndicator indicator= CircularPercentIndicator(
      radius: radius,
      lineWidth: lineW,
      circularStrokeCap: CircularStrokeCap.round,
      percent: values[len-1],
      progressColor: colors[len-1],
      backgroundColor: backColor,
      animation: true,
      animationDuration: 400,
    );
    for(int i = values.length-2; i>=0; --i){
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
}