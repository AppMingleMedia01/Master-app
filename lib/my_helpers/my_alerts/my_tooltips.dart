part of 'alert.dart';
class MyTooltip extends StatelessWidget {
  final Widget child;
  final String message;

  const MyTooltip({super.key, required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: message,
      padding: EdgeInsets.symmetric(horizontal: size_12,vertical: size_6),
      margin: EdgeInsets.all(size_12),
      showDuration: const Duration(seconds: 10),
      decoration: BoxDecoration(
        color: MyColors.appColor.withOpacity(0.9),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      textStyle: const TextStyle(color: Colors.white),
      preferBelow: true,
      verticalOffset: 10,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(key),
        child: child,
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }
}