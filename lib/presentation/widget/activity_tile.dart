import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_edu/domain/entity/activity.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/util/format_util.dart';

class ActivityTile extends StatelessWidget {
  final Activity activity;
  final Function onTap;

  const ActivityTile({super.key, required this.activity, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: const Icon(Icons.sports_soccer),
        tileColor: context.theme.colorScheme.onInverseSurface,
        title: Text(
          activity.title,
          style: context.theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          FormatUtil.ymdStr(activity.time),
          style: context.theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.theme.colorScheme.primary,
            letterSpacing: -0.5,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        hoverColor: context.theme.colorScheme.primary.withOpacity(0.1),
        enabled: true,
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
          side: BorderSide(
            color: context.theme.colorScheme.primary.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
    );
  }
}
