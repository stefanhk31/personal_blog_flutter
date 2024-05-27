import 'package:blog_ui/blog_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class BlogDetailContentComponent extends WidgetbookComponent {
  BlogDetailContentComponent()
      : super(
          name: 'BlogDetailContent',
          useCases: [
            _BlogDetailContentUseCase(),
          ],
        );
}

class _BlogDetailContentUseCase extends WidgetbookUseCase {
  _BlogDetailContentUseCase()
      : super(
          name: 'BlogDetailContent',
          builder: (context) => BlogDetailContent(
            authorName: 'Stefan Hodges-Kluck',
            body: htmlBody,
            published: DateTime.now(),
            slug: 'example-post',
            title: 'Example Post',
            authorImage:
                'https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/05b7d86c-5303-4e1e-8ada-bf2ea0835938',
            featuredImage: 'https://cdn.buttercms.com/gpX5UkSTPkQLOVKsv58g',
          ),
        );
}

const htmlBody = '''
<p>Welcome to ButterCMS! This an example blog post written using Butter.</p>
<h1>Header 1</h1>
<h2>Header 2</h2>
<h3>Header 3</h3>
<p>List:</p>
<ul>
<li>list one</li>
<li>list two</li>
<li>list three</li>
</ul>
<p>Numbered list:</p>
<ol>
<li>item one</li>
<li>item two&nbsp;</li>
<li>item three</li>
</ol>
<p>Inline <code>code sample</code> example.</p>
<p> Inline <em>italic</em> and <strong>bold</strong> text.</p>
<p>Here's a helpful walkthrough of our Blog Engine solution.</p>
<p><br><a href="/demo/blog-engine-why-our-blog-engine/">https://buttercms.com/demo/blog-engine-why-our-blog-engine/</a></p>
<p></p>
<p></p>
<p>Code sample:</p>
<p></p>
<pre class="language-undefined"><code> void hello() {
  print('hello');
}</code></pre>
<p></p>
<h3>What's happening here?</h3>
<p>If you're viewing this post from your website or command line, you've successfully made a request to&nbsp;the <a href="/docs/api">Butter API</a>. If you haven't already, make sure you have our <a href="/docs/">development guides</a> pulled up for step-by-step instructions on setting up Butter.</p>
<h3>How does&nbsp;editing work?</h3>
<p>Butter's WYSIWYG editor supports standard text formatting including headings, links, quotes, code, text alignment, and more. You can upload, crop, and resize images which are automatically hosted and delivered through a CDN (see below). You can also edit HTML directly when needed.</p>
<figure class="image">
    <img src="https://d2wzhk7xhrnk1x.cloudfront.net/rgPM9aHoSSKnjk44TQlD_butter-blog-post.jpg" alt="Delivered to you via CDN">
    <figcaption>Delivered to you via CDN</figcaption>
</figure>
<h3>Can I use Butter as a full CMS for&nbsp;things other than a&nbsp;blog?</h3>
<p>Yes. Butter can be used as a full CMS for managing dynamic content and creating pages across your entire website or app. Check out our <a href="/docs/">development guides</a> for step-by-step tutorials on setting this up.</p>
''';
