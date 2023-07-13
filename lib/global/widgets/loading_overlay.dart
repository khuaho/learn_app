import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.child,
    required this.loading,
    this.loadingShimmer,
  });

  final Widget child;
  final bool loading;
  final Widget? loadingShimmer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loading)
          loadingShimmer ??
              const SizedBox.expand(
                child: ColoredBox(
                  color: Colors.black26,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
      ],
    );
  }
}
