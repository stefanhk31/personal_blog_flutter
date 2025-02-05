import 'package:blog_html_builder/src/templates/templates.dart';

class BlogFooter extends HtmlTemplate {
  const BlogFooter();

  @override
  String html() {
    final dateTime = DateTime.now();
    return '''
    <footer class="bg-background-light dark:bg-background-dark">
      <div class="flex flex-row">
        <div class="mx-auto max-w-4xl p-4">
          <picture>
            <source srcset="assets/images/butter_cms_black.png" media="(prefers-color-scheme: light)"/>
            <source srcset="assets/images/butter_cms_white.png"  media="(prefers-color-scheme: dark)"/>
            <img src="assets/images/butter_cms_black.png"/>
          </picture>
        </div>
        <div class="mx-auto max-w-4xl p-4">
          <p class="text-text-light dark:text-text-dark">
            Copyright ${dateTime.year};
          </p>
        </div>
      </div>
    </footer>
    ''';
  }
}
