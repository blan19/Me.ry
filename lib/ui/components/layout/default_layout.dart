import 'package:diary/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefaultLayout extends ConsumerWidget {
  final PreferredSizeWidget? appbar;
  final List<Widget>? widgets;
  final Widget? floatingActionButton;

  const DefaultLayout({
    super.key,
    this.appbar,
    this.widgets,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
      appBar: appbar,
      floatingActionButton: floatingActionButton,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.appVar.spacing),
        child: Column(
          children: [
            if (widgets != null) ...widgets!,
          ],
        ),
      ),
    );
  }
}
