# jQuery MultiCheck

## Installation

Include script *after* the jQuery library:

```html
<link rel="stylesheet" href="jquery.multicheck.css" />
<script src="/path/to/jquery.multicheck.js"></script>
```

## Options

### Default options

```javascript
DEFAULTS = {
  // Wrap each label in HTML structure. Example for Bootstrap: '<div class="checkbox"></div>'
  label_wrap: '',
  // Container with scrolling and borders
  scroll_wrapper_enabled: false,
  // if scroll_wrapper_enabled is true then selected_element is active element with class multicheck-on.
  selected_element: 'label'
};
```