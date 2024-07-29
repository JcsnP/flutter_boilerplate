import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Future<void> Function()? onRefresh;
  final Widget? trailing;
  final Color? navigationBarColor;
  final bool automaticallyImplyLeading;
  final EdgeInsetsDirectional? navigationBarPadding;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.children,
    this.onRefresh,
    this.trailing,
    this.navigationBarColor = Colors.transparent,
    this.automaticallyImplyLeading = true,
    this.navigationBarPadding,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          CupertinoSliverNavigationBar(
            automaticallyImplyLeading: automaticallyImplyLeading,
            backgroundColor: navigationBarColor,
            largeTitle: Text(title),
            trailing: trailing,
            padding: navigationBarPadding,
          ),
          onRefresh != null
              ? CupertinoSliverRefreshControl(
                  onRefresh: onRefresh,
                )
              : const SliverToBoxAdapter(),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(delegate: SliverChildListDelegate(children)),
          ),
        ],
      ),
    );
  }
}
