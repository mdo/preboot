---
layout: default
---

## Introducing Preboot

[Preboot](http://github.com/mdo/preboot) is a comprehensive and flexible collection of [Sass](http://sass-lang.com) utilities. Its original variables and mixins became the precursor to [Bootstrap](http://getbootstrap.com). Since then, it's all come full circle.

After a two-year hiatus, Preboot was reborn with many of the variable and mixin improvements from Bootstrap 3, along with some new enhancements, too. It's one of the lightest and most powerful tools for CSS development without any prebuilt components.

Then, another two years later, Preboot 3 was made. Major changes included switching from Less to Sass, dropping most vendor prefix mixins, and overhauled documentation.

Need something more powerful? Use [Bootstrap](http://getbootstrap.com").

<a class="btn" href="https://github.com/mdo/preboot/archive/master.zip">Download Preboot 3</a>
<a class="btn" href="https://github.com/mdo/preboot">GitHub project</a>

*Previous releases of Preboot are [available on GitHub](https://github.com/mdo/preboot/releases/).*

## What's included

Here's the rundown of what you can find in Preboot. Jump to a section for some lightweight documentation and code snippets.

* Will be replaced with the ToC, excluding the first two headers
{:toc}

## Variables

Variables still don't exist in CSS, but they do in LESS and other CSS preprocessors. Preboot includes a several groups of meaningful and useful variables for any project.

### Colors

Easily make use of two color schemes included in Preboot: grayscale and semantic. Grayscale colors provide quick access to shades of black (in increments of 10%) while semantic includes various colors assigned to meaningful values.

<div class="color-swatches">
  <div class="color-swatch black-10"></div>
  <div class="color-swatch black-20"></div>
  <div class="color-swatch black-30"></div>
  <div class="color-swatch black-40"></div>
  <div class="color-swatch black-50"></div>
  <div class="color-swatch black-60"></div>
  <div class="color-swatch black-70"></div>
  <div class="color-swatch black-80"></div>
  <div class="color-swatch black-90"></div>
</div>

{% highlight css linenos %}
$black-10: darken(#fff, 10%);
$black-20: darken(#fff, 20%);
$black-30: darken(#fff, 30%);
$black-40: darken(#fff, 40%);
$black-50: darken(#fff, 50%);
$black-60: darken(#fff, 60%);
$black-70: darken(#fff, 70%);
$black-80: darken(#fff, 80%);
$black-90: darken(#fff, 90%);
{% endhighlight %}

<div class="color-swatches">
  <div class="color-swatch brand-primary"></div>
  <div class="color-swatch brand-success"></div>
  <div class="color-swatch brand-warning"></div>
  <div class="color-swatch brand-danger"></div>
  <div class="color-swatch brand-info"></div>
</div>

{% highlight css linenos %}
$brand-primary: #428bca;
$brand-success: #5cb85c;
$brand-warning: #f0ad4e;
$brand-danger:  #d9534f;
$brand-info:    #5bc0de;
{% endhighlight %}

Use any of these color variables as they are or reassign them to more meaningful variables for your project.

{% highlight scss linenos %}
// Use as-is
.masthead {
  ...
  background-color: $brand-primary;
  ...
}

// Reassigned variables
$alert-message-background: $brand-info;
.alert {
  background-color: $alert-message-background;
}
{% endhighlight %}

### Scaffolding

A handful of variables for quickly customizing key elements of your site's skeleton.

{% highlight scss linenos %}
// Scaffolding
$body-background: #fff;
$text-color:      $black-50;
{% endhighlight %}

### Links

Easily style your links with the right color with only one value.

{% highlight scss linenos %}
// Variables
$link-color:       $brand-primary;
$link-color-hover: darken($link-color, 15%);

// Usage
a {
  color: $link-color;
  text-decoration: none;

  &:hover {
    color: $link-color-hover;
    text-decoration: underline;
  }
}
{% endhighlight %}

Note that the `$link-color-hover` uses a function, another awesome tool from Sass, to automagically create the right hover color. You can use `darken`, `lighten`, `saturate`, and `desaturate`.

### Typography

Easily set your type face, text size, leading, and more with a few quick variables. Preboot makes use of these as well to provide easy typographic mixins as well.

{% highlight scss linenos %}
// Typography

// Font stacks for easy inclusion and customization
$font-family-sans-serif:  "Helvetica Neue", Helvetica, Arial, sans-serif;
$font-family-serif:       Georgia, "Times New Roman", Times, serif;
$font-family-monospace:   Monaco, Menlo, Consolas, "Courier New", monospace;
$font-family-base:        $font-family-sans-serif;

// Generate a straightforward type scale
$font-size-base:          14px;
$font-size-large:         $font-size-base * 1.25; // ~18px
$font-size-small:         $font-size-base * 0.85; // ~12px
$font-size-mini:          $font-size-base * 0.75; // ~11px

// Baseline for the line-height of the body
// To be used in conjunction with $font-size-base
$line-height-base:        20px;

// Enable the option to customize headings
$headings-font-family:    inherit; // From $font-family-base
$headings-font-weight:    500;
{% endhighlight %}

## Grid system

Generate semantic, mobile-first grid layouts with a few variables and mixins, all without superfluous markup.

### Grid variables

There are three grid variables that Preboot uses to power the grid mixins.

{% highlight scss linenos %}
// Specify the number of available columns
$grid-columns:          12;
// Inner padding on each side of a column to create gutters
$grid-column-padding:   15px;
// Point at which the floats kick in and horizontally align columns
$grid-float-breakpoint: 768px;
{% endhighlight %}

Customizing these variables should automatically work with any of the grid mixins, so tweak away.

### Grid mixins

There are three available mixins for each part of a standard grid system:

- `make-row` provides a wrapper for the columns to align their content via negative margin and clear the floats.
- `make-column(*n*)` is used to generate *n* number columns as a percentage of the available grid columns (set via variable to 12 by default).
- `make-column-offset(*n*)` pushes a column right by *n* columns via `margin`.

**Heads up!** These grid columns are mobile first, meaning by default they stack vertically. Floating only kicks in with viewports of 768px or higher.

{% highlight scss linenos %}
@mixin make-row {
  // Negative margin the row out to align the content of columns
  margin-left: -$grid-column-padding;
  margin-right: -$grid-column-padding;
  // Then clear the floated columns
  @include clearfix;
}

@mixin make-column($columns) {
  @media (min-width: $grid-float-breakpoint) {
    float: left;
    // Calculate width based on number of columns available
    width: percentage($columns / $grid-columns);
  }
  // Prevent columns from collapsing when empty
  min-height: 1px;
  // Set inner padding as gutters instead of margin
  padding-left: $grid-column-padding;
  padding-right: $grid-column-padding;
  @include border-box;
}

@mixin make-column-offset($columns) {
  @media (min-width: $grid-float-breakpoint) {
    margin-left: percentage($columns / $grid-columns);
  }
}
{% endhighlight %}

### Example usage

Using these mixins to generate columns is easy. **Here's the HTML and CSS of an example implementation.**

{% highlight html linenos %}
<div class="wrapper">
  <div class="content-main">
    ...
  </div>
  <div class="content-sidebar">
    ...
  </div>
</div>
{% endhighlight %}

{% highlight scss linenos %}
.wrapper {
  @include make-row;
}
.content-main {
  @include make-column(8);
}
.content-sidebar {
  @include make-column(3);
  @include make-column-offset(1);
}
{% endhighlight %}

**Need another example?** Our table of contents at the top of the page uses a custom grid as well. In the source docs.less file you'll find its super lightweight implementation:

{% highlight scss linenos %}
.row {
  @include make-row;
}
.grid-4 {
  @include make-column(4);
}
{% endhighlight %}

**That's it.** No need for additional classes as we just don't need them in this simple of a site.

## Vendor mixins

Write more efficient CSS by writing single-line mixins instead of multiple lines of prefixed properties.

### Box sizing

Reset your components' box model with a single mixin. For context, see this [helpful article from Mozilla](https://developer.mozilla.org/en-US/docs/CSS/box-sizing).

{% highlight scss linenos %}
@mixin border-box {
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
{% endhighlight %}

### Rounded corners

Today all modern browsers support the non-prefixed `border-radius` property. As such, there is no `@mixin border-radius` mixin, but Preboot does include shortcuts for quickly rounding two corners on a particular side of an object.

{% highlight css linenos %}
@mixin border-top-radius($radius) {
  border-top-right-radius: $radius;
   border-top-left-radius: $radius;
}
@mixin border-right-radius($radius) {
  border-bottom-right-radius: $radius;
     border-top-right-radius: $radius;
}
@mixin border-bottom-radius($radius) {
  border-bottom-right-radius: $radius;
   border-bottom-left-radius: $radius;
}
@mixin border-left-radius($radius) {
  border-bottom-left-radius: $radius;
     border-top-left-radius: $radius;
}
{% endhighlight %}

### Placeholder text

Provide context for form controls within each field.

{% highlight scss linenos %}
@mixin placeholder($color: $input-color-placeholder) {
  &:-moz-placeholder            { color: $color; } // Firefox 4-18
  &::-moz-placeholder           { color: $color; } // Firefox 19+
  &:-ms-input-placeholder       { color: $color; } // Internet Explorer 10+
  &::-webkit-input-placeholder  { color: $color; } // Safari and Chrome
}
{% endhighlight %}

### Columns

Generate columns via CSS within a single element.

{% highlight scss linenos %}
@mixin content-columns($width, $count, $gap) {
  -webkit-column-width: $width;
     -moz-column-width: $width;
          column-width: $width;
  -webkit-column-count: $count;
     -moz-column-count: $count;
          column-count: $count;
  -webkit-column-gap: $gap;
     -moz-column-gap: $gap;
          column-gap: $gap;
}
{% endhighlight %}

## Utility mixins

Similar to vendor mixins, utility mixins provide useful and often repeated snippets of CSS in single lines.

### Clearfix

Forget adding `class="clearfix"` to any element and instead use `@include clearfix` where appropriate. Uses the [micro clearfix](http://nicolasgallagher.com/micro-clearfix-hack/) from [Nicolas Gallager](http://twitter.com/necolas).

{% highlight scss linenos %}
// Mixin
@mixin clearfix {
  &:before {
    display: table;
    content: "";
  }

  &:after {
    display: table;
    clear: both;
    content: "";
  }
}

// Usage
.container {
  @include clearfix;
}
{% endhighlight %}

### Horizontal centering

Quickly center any element within its parent. **Requires `width` or `max-width` to be set.**

{% highlight scss linenos %}
// Mixin
@mixin center-block {
  display: block;
  margin-left: auto;
  margin-right: auto;
}

// Usage
.container {
  width: 940px;
  @include center-block;
}
{% endhighlight %}

### Sizing helpers

Specify the dimensions of an object more easily.

{% highlight scss linenos %}
// Mixins
@mixin size($width, $height) {
  width: $width;
  height: $height;
}
@mixin square($size) {
  @include size($size, $size);
}

// Usage
.image { @include size(400px, 300px); }
.avatar { @include square(48px); }
{% endhighlight %}

  <h3 id="mixins-resizable">Resizable textareas</h3>
  <p>Easily configure the resize options for any textarea, or any other element. Defaults to normal browser behavior (<code>both</code>).</p>
{% highlight css linenos %}
.resizable(@direction: both) {
  // Options: horizontal, vertical, both
  resize: @direction;
  // Safari fix
  overflow: auto;
}
{% endhighlight %}

### Truncating text

Easily truncate text with an ellipsis with a single mixin. **Requires element to be `block` or `inline-block` level and a `width` or `max-width`.**

{% highlight scss linenos %}
// Mixin
@mixin text-truncate {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

// Usage
.branch-name {
  display: inline-block;
  max-width: 200px;
  @include text-truncate;
}
{% endhighlight %}

### Retina images

Specify two image paths and the `@1x` image dimensions, and Preboot will provide an `@2x` media query. **If you have many images to serve, consider writing your retina image CSS manually in a single media query.**

{% highlight scss linenos %}
// Mixin
@mixin retina-image($file-1x, $file-2x, $width-1x, $height-1x) {
  background-image: url("${file-1x}");

  @media
  only screen and (-webkit-min-device-pixel-ratio: 2),
  only screen and (   min--moz-device-pixel-ratio: 2),
  only screen and (     -o-min-device-pixel-ratio: 2/1),
  only screen and (        min-device-pixel-ratio: 2),
  only screen and (                min-resolution: 192dpi),
  only screen and (                min-resolution: 2dppx) {
    background-image: url("${file-2x}");
    background-size: $width-1x $height-1x;
  }
}

// Usage
.jumbotron {
  @include retina-image("/img/bg-1x.png", "/img/bg-2x.png", 100px, 100px);
}
{% endhighlight %}
