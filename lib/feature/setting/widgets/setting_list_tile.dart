import 'package:flutter/material.dart';

class ListTitleSettingWidget extends StatelessWidget {
  final IconData leadingIcon;
  final Widget? trailingWidget;
  final String txtTitle;
  final VoidCallback onTap;
  const ListTitleSettingWidget(
      {super.key,
      required this.txtTitle,
      required this.leadingIcon,
      this.trailingWidget,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          txtTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: Icon(
          leadingIcon,
          color: Colors.black,
        ),
        trailing: trailingWidget,
      ),
    );
  }
}
