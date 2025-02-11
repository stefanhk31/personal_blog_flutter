import 'package:blog_html_builder/src/templates/templates.dart';

/// {@template blog_footer}
/// A class to generate the HTML content for the footer of the blog site.
/// {@endtemplate}
class BlogFooter extends HtmlTemplate {
  /// {@macro blog_footer}
  const BlogFooter();

  @override
  String html() {
    final dateTime = DateTime.now();
    return '''
    <footer class="w-full bg-background-light dark:bg-background-dark">
      <div class="flex justify-between">
        <div class="max-w-4xl p-4">
          <picture>
            <source srcset="assets/images/butter_cms_black.png" media="(prefers-color-scheme: light)"/>
            <source srcset="assets/images/butter_cms_white.png"  media="(prefers-color-scheme: dark)"/>
            <img src="assets/images/butter_cms_black.png"/>
          </picture>
        </div>
        <div class="max-w-4xl p-4">
          <p class="text-text-light dark:text-text-dark">
            Copyright ${dateTime.year}
          </p>
        </div>
      </div>
    </footer>
    ''';
  }
}
