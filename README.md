# DaisyUI On Phlex

> **⚠️ WARNING: UNDER ACTIVE DEVELOPMENT ⚠️**
> 
> **🚧 THIS GEM IS NOT READY FOR PRODUCTION USE 🚧**
> 
> This gem is currently in heavy development and APIs may change frequently. Components, installation process, and configuration may break between versions without notice. Please DO NOT use this in production applications yet.
> 
> **Current Status:**
> - ⚠️ Installation process is being refined
> - ⚠️ Components may have bugs or missing features
> - ⚠️ Documentation may be outdated
> 
> **We recommend waiting!**
>
> If you want to contribute or test, please use at your own risk and expect breaking changes.

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

## Setup

Run the install generator to set up DaisyUI components in your Rails application:

```bash
$ rails generate daisyui_on_phlex:install
```

This will:
1. **Copy all 61+ components** to `vendor/daisyui_on_phlex/components/` in your Rails app
2. **Configure autoloader** to serve components from vendor directory instead of gem
3. Install **phlex-rails** dependency if not already present
4. Download the latest **DaisyUI JavaScript files**
5. Configure your **Tailwind CSS** to include the DaisyUI plugin
6. Add CSS imports to your application
7. Provide usage instructions

### Why Copy to Vendor?

Unlike traditional gems that load components from memory, DaisyUI On Phlex follows the **shadcn-ui approach** by copying components directly to your application. This gives you:

- ✅ **Full ownership** of component code in your app
- ✅ **Easy customization** - edit components locally
- ✅ **No gem dependencies** for component logic after installation
- ✅ **Version control** your component modifications
- ✅ **Better debugging** with direct access to source code

After installation, all components will be available from `vendor/daisyui_on_phlex/components/` and you can modify them as needed for your project.

### Manual Configuration (Optional)

If you prefer manual setup or need to customize the installation:

#### 1. Configure your HTML layout

Make sure your HTML layout supports theme switching by adding the `data-theme` attribute:

```erb
<!DOCTYPE html>
<html data-theme="light">
  <head>
    <!-- Your head content -->
  </head>
  <body>
    <!-- Your body content -->
  </body>
</html>
```

#### 2. Theme Configuration

The CSS file includes the most popular DaisyUI themes by default:
- `light` (default), `dark` (prefers dark mode)
- `cupcake`, `dracula`, `emerald`, `corporate`, `synthwave`, `retro`, `cyberpunk`
- `valentine`, `halloween`, `garden`, `forest`, `aqua`, `lofi`, `pastel`
- `fantasy`, `wireframe`, `black`, `luxury`, `autumn`, `business`
- `acid`, `lemonade`, `night`, `coffee`, `winter`, `dim`, `nord`, `sunset`

#### 3. Theme Switching

To enable theme switching, you can use the `data-theme` attribute:

```erb
<select data-choose-theme>
  <option value="light">Light</option>
  <option value="dark">Dark</option>
  <option value="cupcake">Cupcake</option>
  <option value="dracula">Dracula</option>
  <!-- Add more themes as needed -->
</select>
```

For automatic theme switching, consider using the [theme-change](https://github.com/saadeghi/theme-change) library:

```bash
npm install theme-change
```

Then initialize it in your JavaScript:

```javascript
import { themeChange } from 'theme-change'
themeChange()
```

## Usage

After running the install generator, all DaisyUI components will be copied to your `vendor/daisyui_on_phlex/components/` directory and automatically available in your application.

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

After installation, all 61+ DaisyUI components are copied to your `vendor/daisyui_on_phlex/components/` directory and ready to use. You can customize any component by editing the files directly in your vendor folder.

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

## Customization

Since all components are copied to your `vendor/daisyui_on_phlex/components/` directory, you have full control over their implementation:

### Modifying Components

```bash
# All components are in your vendor directory
ls vendor/daisyui_on_phlex/components/

# Edit any component directly
code vendor/daisyui_on_phlex/components/button.rb
```

### Creating Custom Variants

```ruby
# In vendor/daisyui_on_phlex/components/button.rb
module DaisyuiOnPhlex
  module Components  
    class Button < DaisyuiOnPhlex::Base
      def initialize(variant: :primary, custom_style: nil, **attributes)
        @variant = variant
        @custom_style = custom_style
        @attributes = attributes
      end

      private

      def component_classes
        classes = ["btn"]
        classes << "btn-#{@variant}" if @variant
        classes << @custom_style if @custom_style  # Your custom styles
        classes.join(" ")
      end
    end
  end
end
```

All changes will be preserved in your application and tracked in your version control system.

### Vendor Directory Structure

After installation, your vendor directory will contain:

```
vendor/daisyui_on_phlex/
├── base.rb                    # Base class for all components
└── components/
    ├── accordion.rb
    ├── alert.rb
    ├── avatar.rb
    ├── badge.rb
    ├── button.rb
    ├── card.rb
    ├── ...                    # All 61+ components
    └── tooltip.rb
```

### Troubleshooting

If you encounter issues:

1. **Generator fails**: Ensure you're in a Rails application directory and have proper permissions
2. **Components not found**: Check that `config/initializers/daisyui_on_phlex_vendor.rb` was created
3. **Styles not loading**: Ensure the CSS import is after `@import "tailwindcss";`
4. **Themes not working**: Check that your HTML has the `data-theme` attribute
5. **Build errors**: Make sure you have Tailwind CSS properly configured in your Rails app
6. **Vendor directory issues**: Verify components were copied to `vendor/daisyui_on_phlex/components/`

You can safely re-run the generator to update components or fix configuration:

```bash
rails generate daisyui_on_phlex:install
```

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
