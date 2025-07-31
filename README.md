# DaisyUI On Phlex

[![Gem Version](https://badge.fury.io/rb/daisyui_on_phlex.svg)](https://badge.fury.io/rb/daisyui_on_phlex)

A Ruby gem that provides [DaisyUI](https://daisyui.com) components as [Phlex](https://phlex.fun) components for Rails applications. This gem makes it easy to use DaisyUI's beautiful components in your Ruby on Rails projects with the power and simplicity of Phlex.

## Features

- 🎨 **Beautiful Components**: All DaisyUI components wrapped as Phlex components
- 🚀 **Easy Integration**: Simple setup with Rails applications
- 🔧 **Customizable**: Full access to DaisyUI's theming and customization options
- 📦 **Lightweight**: Only includes the components you use
- 🎯 **Type Safe**: Written with Ruby best practices
- 🎭 **Theme Support**: 25+ built-in themes with easy switching
- ♿ **Accessible**: Enhanced accessibility features and ARIA support

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'daisyui_on_phlex'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install daisyui_on_phlex
```

## Quick Setup

After installation, add the CSS import to your `app/assets/stylesheets/application.css`:

```css
@import "tailwindcss";
@import "daisyui_on_phlex/stylesheets/daisyui_on_phlex.css";
```

Make sure your HTML layout supports themes:

```erb
<!DOCTYPE html>
<html data-theme="light">
  <!-- Your app content -->
</html>
```

For detailed setup instructions, see [INSTALLATION.md](INSTALLATION.md).

## Setup

Run the install generator to set up DaisyUI in your Rails application:

```bash
$ rails generate daisyui_on_phlex:install
```

This will:
1. Download the latest DaisyUI JavaScript files
2. Configure your Tailwind CSS to include the DaisyUI plugin
3. Provide usage instructions

## Usage

Use DaisyUI components in your Phlex views:

### Button Component

```ruby
class MyView < Phlex::HTML
  def view_template
    # Basic button
    render DaisyuiOnPhlex::Components::Button.new(variant: :primary) do
      "Click me!"
    end
    
    # Button with options
    render DaisyuiOnPhlex::Components::Button.new(
      variant: :secondary,
      size: :lg,
      outline: true
    ) do
      "Large Outline Button"
    end
  end
end
```

### Alert Component

```ruby
render DaisyuiOnPhlex::Components::Alert.new(variant: :success) do
  "Operation completed successfully!"
end

render DaisyuiOnPhlex::Components::Alert.new(variant: :error) do
  "Something went wrong!"
end
```

### Card Component

```ruby
render DaisyuiOnPhlex::Components::Card.new(bordered: true) do |card|
  card.body do
    card.title { "Card Title" }
    p { "This is the card content" }
    card.actions do
      render DaisyuiOnPhlex::Components::Button.new(variant: :primary) { "Action" }
    end
  end
end
```

### Badge Component

```ruby
render DaisyuiOnPhlex::Components::Badge.new(variant: :primary) { "New" }
render DaisyuiOnPhlex::Components::Badge.new(variant: :success, outline: true) { "Success" }
```

### Modal Component

```ruby
render DaisyuiOnPhlex::Components::Modal.new(id: "my-modal") do |modal|
  modal.title { "Modal Title" }
  p { "Modal content goes here" }
  modal.action do
    modal.close_button("Close")
    render DaisyuiOnPhlex::Components::Button.new(variant: :primary) { "Save" }
  end
end

# To open the modal, use a button or link that targets the modal ID
render DaisyuiOnPhlex::Components::Button.new do
  label for: "my-modal" do
    "Open Modal"
  end
end
```

### Input Component

```ruby
render DaisyuiOnPhlex::Components::Input.new(
  type: :text,
  placeholder: "Enter your name",
  variant: :primary
)

render DaisyuiOnPhlex::Components::Input.new(
  type: :email,
  size: :lg,
  bordered: true
)
```

## Available Components

All 61+ DaisyUI components are now implemented as Phlex components:

### Actions
- **Button** - Interactive buttons with multiple variants and sizes
- **Dropdown** - Dropdown menus and popovers
- **Modal** - Overlay dialogs and modals  
- **Swap** - Toggle between two states with animations
- **Theme Controller** - Theme switching controls

### Data Display
- **Accordion** - Collapsible content sections
- **Avatar** - User profile images with various styles
- **Badge** - Small status indicators and labels
- **Card** - Content containers with optional borders and layouts
- **Carousel** - Image and content sliders
- **Chat** - Chat bubble components for messaging interfaces
- **Collapse** - Collapsible content areas
- **Countdown** - Animated countdown displays
- **Kbd** - Keyboard shortcut styling
- **Stat** - Statistics display blocks
- **Table** - Data tables with sorting and styling
- **Timeline** - Chronological event displays

### Data Input
- **Checkbox** - Checkbox form controls
- **File Input** - File upload inputs with drag & drop
- **Input** - Text input fields with styling variants
- **Radio** - Radio button form controls
- **Range** - Range slider inputs
- **Rating** - Star rating components
- **Select** - Dropdown select inputs
- **Textarea** - Multi-line text inputs
- **Toggle** - Toggle switch controls

### Layout
- **Divider** - Visual content separators
- **Drawer** - Slide-out navigation panels
- **Footer** - Page footer sections
- **Hero** - Hero sections with backgrounds
- **Indicator** - Corner indicators and badges
- **Join** - Grouped elements with shared borders
- **Mask** - Image cropping with various shapes
- **Stack** - Layered element positioning

### Navigation
- **Breadcrumbs** - Navigation breadcrumb trails
- **Dock** - Bottom navigation bars
- **Link** - Styled hyperlinks
- **Menu** - Navigation menus and lists
- **Navbar** - Top navigation bars
- **Pagination** - Page navigation controls
- **Steps** - Step-by-step progress indicators
- **Tab** - Tabbed content interfaces

### Feedback
- **Alert** - Notification messages with different types
- **Loading** - Loading spinners and animations
- **Progress** - Progress bars
- **Radial Progress** - Circular progress indicators
- **Skeleton** - Loading state placeholders
- **Toast** - Temporary notification popups
- **Tooltip** - Hover information displays

### Mockups
- **Mockup Browser** - Browser window mockups
- **Mockup Code** - Code editor mockups
- **Mockup Phone** - Mobile device mockups
- **Mockup Window** - Desktop window mockups

### Utilities
- **Calendar** - Calendar styling support
- **Diff** - Side-by-side content comparison
- **Filter** - Filter controls for data
- **Fieldset** - Form field grouping
- **Label** - Form field labels
- **List** - Styled lists and menus
- **Status** - Status indicators
- **Validator** - Form validation styling

All components follow DaisyUI's design system and support the full range of variants, sizes, and styling options. Check the [DaisyUI documentation](https://daisyui.com/components/) for detailed usage examples and styling options.

## Component Options

### Button Options
- `variant`: `:primary`, `:secondary`, `:accent`, `:neutral`, `:info`, `:success`, `:warning`, `:error`, `:ghost`, `:link`
- `size`: `:xs`, `:sm`, `:md`, `:lg`
- `outline`: `true/false`
- `ghost`: `true/false`
- `active`: `true/false`
- `disabled`: `true/false`
- `loading`: `true/false`
- `wide`: `true/false`
- `block`: `true/false`
- `circle`: `true/false`
- `square`: `true/false`

### Alert Options  
- `variant`: `:info`, `:success`, `:warning`, `:error`

### Card Options
- `compact`: `true/false`
- `bordered`: `true/false`
- `image_full`: `true/false`
- `side`: `true/false`

## Requirements

- Ruby >= 3.0.0
- Rails >= 6.0
- Phlex >= 1.0
- Tailwind CSS configured in your Rails application

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jacob/daisyui-on-phlex.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
