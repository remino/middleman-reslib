middleman-reslib
================

Personal Middleman extensions to help me build sites with it and [mansite](https://github.com/remino/mansite).

Use at your own risk.

## Available Middleware

### `MiddlemanReslib::ConvertBackToTopToNav`

Rack middleware that converts `p > a[href="#"]` links into `nav` elements in rendered HTML.

Default usage:

```ruby
use ::MiddlemanReslib::ConvertBackToTopToNav
```

### `MiddlemanReslib::RemoveIndentOnDialog`

Rack middleware that adds a CSS class to dialogue paragraphs in HTML output when the paragraph contains at least two lines starting with an em dash.

Default behavior:

```ruby
use ::MiddlemanReslib::RemoveIndentOnDialog
```

Optional class override:

```ruby
use ::MiddlemanReslib::RemoveIndentOnDialog, class_name: "dialogue"
```

The default class name is `no-indent`.

## Release

Release this gem in two commits:

1. Commit the code changes.
2. Bump the version in `middleman-reslib.gemspec` and commit that separately.
3. Create the git tag for the version commit with `rake release`.
4. Push the branch and the tag.

Example:

```bash
git add README.md lib/middleman-reslib/*.rb spec/middleman_reslib
git commit -m "Add middleware helpers"

# bump s.version in middleman-reslib.gemspec
git add middleman-reslib.gemspec
git commit -m "Bump version to 0.4.6"

gem_push=no bundle exec rake release
```

`gem_push=no` keeps Bundler from pushing the gem to RubyGems while still creating the git tag and pushing it.
