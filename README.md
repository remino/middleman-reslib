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
