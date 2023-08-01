import 'package:diary/foundation/constants.dart';
import 'package:diary/styles/app_theme.dart';
import 'package:diary/styles/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:indexed/indexed.dart';

class DiaryItem extends ConsumerWidget {
  final String? img;
  final String process;
  final String createAt;

  const DiaryItem({
    super.key,
    required this.process,
    required this.createAt,
    this.img,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    if (process == Process.W.level) {
      return _wait(
        theme: theme,
      );
    }

    return _item(theme: theme, img: img!);
  }

  Container _wait({
    required AppTheme theme,
  }) {
    return Container(
      height: 175,
      decoration: BoxDecoration(
        color: theme.appColors.black_02,
        borderRadius: BorderRadius.circular(theme.appVar.corner_02),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ME.RY가\n답장을 쓰고 있어요",
                  style: theme.textTheme.b_17.white().bold().lineHeight(),
                ),
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 41,
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  createAt,
                  style: theme.textTheme.b_17.white().semiBold(),
                ),
                const Gap(4),
                Text(
                  "수",
                  style: theme.textTheme.b_14.white(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox _item({
    required AppTheme theme,
    required String img,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 175,
      child: Indexer(
        children: [
          Indexed(
            index: 0,
            child: Image.network(
              img,
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Indexed(
            index: 1,
            child: Positioned(
              left: 20,
              bottom: 16,
              child: Row(
                children: [
                  Text(
                    "25",
                    style: theme.textTheme.b_17.white().semiBold(),
                  ),
                  const Gap(4),
                  Text(
                    "수",
                    style: theme.textTheme.b_14.white(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
