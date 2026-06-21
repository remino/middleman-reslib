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
