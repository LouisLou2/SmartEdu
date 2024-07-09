import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_edu/extension/context_extension.dart';

class CourseSched extends StatefulWidget{
  const CourseSched({super.key});

  @override
  State<CourseSched> createState() => _CourseSchedState();
}

class _CourseSchedState extends State<CourseSched>{

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: Row(
        children: [
          Drawer(
            backgroundColor: context.theme.colorScheme.surface,
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Course Schedule'),
                  onTap: (){},
                ),
                ListTile(
                  title: const Text('Course Progress'),
                  onTap: (){},
                ),
                ListTile(
                  title: const Text('Course Material'),
                  onTap: (){},
                ),
                ListTile(
                  title: const Text('Course Discussion'),
                  onTap: (){},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}