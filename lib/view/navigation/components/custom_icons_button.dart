import 'package:fiber/config/constant.dart';

class CustomIconsButton extends StatelessWidget {
  final String? icon;
  final Widget? iconWidget;
  final String? title;
  final bool isSelected;
  const CustomIconsButton({
    super.key,
    this.icon,
    this.iconWidget,
    this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.small),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: Insets.large + 5,
            height: Insets.large + 5,
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(color: context.theme.colorScheme.primary)
                  : Border.all(
                      color: context.theme.colorScheme.outline.withOpacity(0)),
              shape: BoxShape.circle,
            ),
            child: iconWidget ??
                SvgPicture.asset(icon!,
                    color: isSelected
                        ? context.theme.colorScheme.primary
                        : context.theme.colorScheme.outline),
          ),
          Gap(Insets.exSmall - 2),
          Text(
            title ?? '-',
            style: context.theme.textTheme.labelMedium!.copyWith(
                color: isSelected
                    ? context.theme.colorScheme.primary
                    : context.theme.colorScheme.outline),
          ),
        ],
      ),
    );
  }
}
