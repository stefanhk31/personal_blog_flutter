const rawJsonBlogsResponse = '''
{
  "meta": {
    "count": 1,
    "next_page": null,
    "previous_page": null
  },
  "data": [
    {
      "url": "http://www.example.com/blog/this-is-a-blog-post",
      "created": "2020-10-08T18:29:19.987936Z",
      "updated": "2020-10-09T15:49:54.580309Z",
      "published": "2020-10-08T18:08:00Z",
      "author": {
        "first_name": "API",
        "last_name": "Test",
        "email": "apitest@buttercms.com",
        "slug": "api-test",
        "bio": "This is my bio.",
        "title": "API",
        "linkedin_url": "https://www.linkedin.com/in/API",
        "facebook_url": "https://www.facebook.com/API",
        "twitter_handle": "buttercmsapi",
        "profile_image": "https://buttercms.com/api.png"
      },
      "categories": [
        {
          "name": "test category",
          "slug": "test-category"
        }
      ],
      "tags": [
        {
          "name": "test tag",
          "slug": "test-tag"
        }
      ],
      "featured_image": null,
      "featured_image_alt": "",
      "slug": "this-is-a-blog-post",
      "title": "This is a blog post",
      "body": "<p>This is a blog post to test the API.</p>",
      "summary": "This is a blog post to test the API.",
      "seo_title": "This is a blog post",
      "meta_description": "This is a blog post to test the API.",
      "status": "published"
    }
  ]
}
''';

const rawJsonBlogsResponseExcludeBody = '''
{
  "meta": {
    "count": 1,
    "next_page": null,
    "previous_page": null
  },
  "data": [
    {
      "url": "http://www.example.com/blog/this-is-a-blog-post",
      "created": "2020-10-08T18:29:19.987936Z",
      "updated": "2020-10-09T15:49:54.580309Z",
      "published": "2020-10-08T18:08:00Z",
      "author": {
        "first_name": "API",
        "last_name": "Test",
        "email": "apitest@buttercms.com",
        "slug": "api-test",
        "bio": "This is my bio.",
        "title": "API",
        "linkedin_url": "https://www.linkedin.com/in/API",
        "facebook_url": "https://www.facebook.com/API",
        "twitter_handle": "buttercmsapi",
        "profile_image": "https://buttercms.com/api.png"
      },
      "categories": [
        {
          "name": "test category",
          "slug": "test-category"
        }
      ],
      "tags": [
        {
          "name": "test tag",
          "slug": "test-tag"
        }
      ],
      "featured_image": null,
      "featured_image_alt": "",
      "slug": "this-is-a-blog-post",
      "title": "This is a blog post",
      "summary": "This is a blog post to test the API.",
      "seo_title": "This is a blog post",
      "meta_description": "This is a blog post to test the API.",
      "status": "published"
    }
  ]
}
''';

const rawJsonBlogResponse = '''
{
    "meta": {
        "next_post": null,
        "previous_post": null
    },
    "data": {
        "created": "2024-01-30T01:22:27.602968Z",
        "published": "2024-01-30T01:22:27.602566Z",
        "url": "http://www.example.com/blog/this-is-a-blog-post",
        "slug": "example-post",
        "featured_image": "https://cdn.buttercms.com/gpX5UkSTPkQLOVKsv58g",
        "featured_image_alt": "",
        "author": {
            "first_name": "Stefan",
            "last_name": "Hodges-Kluck",
            "email": "shodgeskluck@gmail.com",
            "slug": "stefan-hodges-kluck",
            "bio": "",
            "title": "",
            "linkedin_url": "",
            "facebook_url": "",
            "instagram_url": "",
            "pinterest_url": "",
            "twitter_handle": "",
            "profile_image": "https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/05b7d86c-5303-4e1e-8ada-bf2ea0835938"
        },
        "tags": [
            {
                "name": "Example Tag",
                "slug": "example-tag"
            }
        ],
        "categories": [
            {
                "name": "Example Category",
                "slug": "example-category"
            }
        ],
        "title": "Example Post",
        "body": "<p>This is a blog post to test the API.</p>",
        "summary": "This is an example blog post. Pretty neat huh?",
        "updated": "2024-01-30T01:22:27.633277Z",
        "seo_title": "Example Post SEO Optimized Title",
        "meta_description": "This is our example blog posts SEO optimized meta description.",
        "status": "published"
    }
}
''';
