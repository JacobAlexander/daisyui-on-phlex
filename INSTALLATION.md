# DaisyUI on Phlex Installation

After installing the gem, follow these steps to set up DaisyUI styles in your Rails application:

## 1. Import the main CSS file

Add the following import to your `app/assets/stylesheets/application.css` (or `app/assets/stylesheets/application.tailwind.css` if using tailwindcss-rails):

```css
@import "tailwindcss";
@import "daisyui_on_phlex/stylesheets/daisyui_on_phlex.css";
```

## 2. Configure your HTML layout

Make sure your HTML layout supports theme switching by adding the `data-theme` attribute to your `<html>` tag:

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

## 3. Theme Configuration

The CSS file includes the most popular DaisyUI themes by default:
- `light` (default)
- `dark` (prefers dark mode)
- `cupcake`, `dracula`, `emerald`, `corporate`, `synthwave`, `retro`, `cyberpunk`
- `valentine`, `halloween`, `garden`, `forest`, `aqua`, `lofi`, `pastel`
- `fantasy`, `wireframe`, `black`, `luxury`, `autumn`, `business`
- `acid`, `lemonade`, `night`, `coffee`, `winter`, `dim`, `nord`, `sunset`

## 4. Theme Switching

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

## 5. Custom Themes

If you want to add custom themes or modify the theme list, you can create your own CSS file that overrides the default configuration:

```css
@import "tailwindcss";

@plugin "daisyui" {
  themes: light --default, dark --prefersdark, your-custom-theme;
}

@plugin "daisyui/theme" {
  name: "your-custom-theme";
  default: false;
  color-scheme: light;
  
  --color-primary: oklch(55% 0.3 240);
  --color-primary-content: oklch(98% 0.01 240);
  /* Add more custom colors */
}

@import "daisyui_on_phlex/stylesheets/daisyui_on_phlex.css";
```

## 6. Component Usage

Now you can use DaisyUI on Phlex components in your views:

```ruby
# In your view or component
render DaisyuiOnPhlex::Components::Button.new(variant: :primary) do
  "Click me!"
end

render DaisyuiOnPhlex::Components::Card.new(class: "w-96") do |card|
  card.with_body do
    "This is a card with DaisyUI styling"
  end
end
```

## Features Included

The main CSS file provides:

- **Theme Configuration**: 25+ popular DaisyUI themes enabled
- **Accessibility Enhancements**: Better focus styles, high contrast support
- **Responsive Design**: Mobile-first approach with responsive utilities
- **Animation Support**: Smooth transitions and micro-interactions
- **Print Styles**: Optimized printing experience
- **Performance**: Reduced motion support for accessibility
- **Developer Experience**: Enhanced component integration

## Troubleshooting

If you encounter issues:

1. **Styles not loading**: Ensure the import is after `@import "tailwindcss";`
2. **Themes not working**: Check that your HTML has the `data-theme` attribute
3. **Build errors**: Make sure you have Tailwind CSS properly configured in your Rails app
4. **Missing components**: Verify that the gem is properly installed and required

For more help, check the [project repository](https://github.com/jacob/daisyui-on-phlex) or open an issue.
