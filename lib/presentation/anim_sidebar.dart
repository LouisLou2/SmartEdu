import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  bool showSideBar = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collapsible Sidebar'),
      ),
      body: Row(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              return SizeTransition(
                key: ValueKey<Key?>(child.key),
                sizeFactor: animation,
                axis: Axis.horizontal,
                axisAlignment: -1.0,
                child: child,
              );
            },
            switchInCurve: Curves.ease,
            switchOutCurve: Curves.easeOut,
            // layoutBuilder: (currentChild, previousChildren) {
            //   return Stack(
            //     alignment: Alignment.centerLeft,
            //     children: <Widget>[
            //       ...previousChildren,
            //       if (currentChild != null) currentChild,
            //     ],
            //   );
            // },
            child: Sidebar(
              key: ValueKey(showSideBar),
              showSidebar: showSideBar,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, __) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.lime),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                  ),
                );
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showSideBar = !showSideBar;
          });
        },
        child: const Icon(Icons.menu),
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  final bool _showSidebar;
  const Sidebar({
    super.key,
    required bool showSidebar,
  })  : _showSidebar = showSidebar;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeColors.primary,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Button(
            onPressed: () {},
            type: ButtonType.transparent,
            icon: Icons.home,
            label: 'Home',
            iconOnly: !_showSidebar,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Button(
                icon: Icons.person_2_outlined,
                label: 'Profile',
                type: ButtonType.transparent,
                iconOnly: !_showSidebar,
                onPressed: () {},
              ),
              Button(
                icon: Icons.chat,
                label: 'Chat',
                type: ButtonType.transparent,
                iconOnly: !_showSidebar,
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  color: ThemeColors.primaryText,
                ),
              ),
              Button(
                icon: Icons.show_chart,
                label: 'Chart',
                type: ButtonType.transparent,
                iconOnly: !_showSidebar,
                onPressed: () {},
              ),
              Button(
                icon: Icons.pie_chart,
                label: 'Pie Chart',
                type: ButtonType.transparent,
                iconOnly: !_showSidebar,
                onPressed: () {},
              ),
            ],
          ),
          Button(
            icon: Icons.settings,
            label: 'Settings',
            type: ButtonType.transparent,
            iconOnly: !_showSidebar,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class ThemeColors {
  static var primary = Colors.lime;

  static var primaryText = Colors.black;

  static var success = Colors.green;

  static var secondary = Colors.pink;

  static var danger = Colors.red;

  static var white = Colors.white;
}

/// Support button theme
enum ButtonType { success, primary, secondary, danger, transparent }

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String? label;
  final IconData? icon;
  final ButtonType? type;
  final bool? iconOnly;

  /// Creates a new button widget.
  ///
  /// The [onPressed] callback must not be null.
  ///
  /// If [iconOnly] is true, the button will display only an icon.
  ///
  /// If [type] is not specified, the primary button type will be used.
  const Button(
      {super.key,
        required this.onPressed,
        this.label,
        this.icon,
        this.iconOnly = false,
        this.type = ButtonType.primary});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: _getColor(),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
          foregroundColor: _getTextColor(),
          elevation: _getColor() == Colors.transparent ? 0 : 2,
          alignment: Alignment.centerLeft,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (icon != null)
            Icon(
              icon!,
              color: _getTextColor(),
            ),
          if (label != null && iconOnly == false)
            const SizedBox(
              width: 8,
            ),
          if (label != null && iconOnly == false)
            Flexible(
              child: Text(
                label!,
                style: TextStyle(color: _getTextColor()),
                softWrap: false,
              ),
            ),
        ],
      ),
    );
  }

  /// Get color by button type
  _getColor() {
    switch (type) {
      case ButtonType.success:
        return ThemeColors.success;
      case ButtonType.primary:
        return ThemeColors.primary;
      case ButtonType.secondary:
        return ThemeColors.secondary;
      case ButtonType.danger:
        return ThemeColors.danger;
      case ButtonType.transparent:
        return Colors.transparent;
      default:
        return ThemeColors.primary;
    }
  }

  _getTextColor() {
    switch (type) {
      case ButtonType.success:
        return ThemeColors.white;
      case ButtonType.primary:
        return ThemeColors.primaryText;
      case ButtonType.secondary:
        return ThemeColors.white;
      case ButtonType.danger:
        return ThemeColors.white;
      case ButtonType.transparent:
        return ThemeColors.primaryText;
      default:
        return ThemeColors.primaryText;
    }
  }
}