import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ZSettingMenuTile extends StatelessWidget {
  const ZSettingMenuTile({
    super.key,
    required this.subtitle,
    required this.title,
    required this.icon,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: ZColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
