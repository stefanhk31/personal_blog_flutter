import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_blog_flutter/app/widgets/widgets.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';

const butterCmsLink = 'https://buttercms.com';

/// Site-wide footer for the blog.
class Footer extends StatelessWidget {
  /// Default constructor for the footer.
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => FooterCubit(),
      child: const FooterView(),
    );
  }
}

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Padding(
        padding: BlogSpacing.horizontalPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _FooterLogo(
                imageSource:
                    Theme.of(context).colorScheme == BlogTheme.lightColorScheme
                        ? 'assets/images/butter_cms_black.png'
                        : 'assets/images/butter_cms_white.png',
                onTap: () =>
                    context.read<FooterCubit>().launchFooterLink(butterCmsLink),
              ),
            ),
            Expanded(
              child: Text(
                context.l10n.copyrightText(DateTime.now().year),
                style: BlogTextStyles.footerTextStyle.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterLogo extends StatelessWidget {
  const _FooterLogo({
    required this.imageSource,
    this.onTap,
  });

  final String imageSource;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 300,
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox.expand(
            child: Image.asset(
              imageSource,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
