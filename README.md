# DaisyUI On Phlex

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

Currently implemented components:

- **Button** - Interactive buttons with multiple variants and sizes
- **Alert** - Notification messages with different types
- **Card** - Content containers with optional borders and layouts
- **Badge** - Small status indicators and labels
- **Modal** - Overlay dialogs and modals
- **Input** - Form input fields with styling variants

More components are being added regularly. Check the [DaisyUI documentation](https://daisyui.com/components/) for the full list of available components.

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
