import 'package:fiber/config/constant.dart';

class CustomRenewCardItem extends StatelessWidget {
  final String title;
  final double prices;
  final bool isActive;
  const CustomRenewCardItem({
    super.key,
    required this.title,
    required this.prices,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.all(Insets.medium),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.theme.colorScheme.primaryContainer,
        ),
        borderRadius: BorderRadius.circular(Insets.large),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: Insets.medium,
                height: Insets.medium,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.theme.colorScheme.primary,
                    width: isActive ? 5 : 1,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Gap(Insets.small),
              Text(
                title,
                style: context.theme.textTheme.titleSmall!.copyWith(),
              ),
            ],
          ),
          Text(
            price().format(prices),
            style: context.theme.textTheme.labelMedium!.copyWith(
              color: context.theme.colorScheme.scrim,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
