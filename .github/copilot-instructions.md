<!-- Use this file to provide workspace-specific custom instructions to Copilot. For more details, visit https://code.visualstudio.com/docs/copilot/copilot-customization#_use-a-githubcopilotinstructionsmd-file -->

# DaisyUI On Phlex Development Instructions

This is a Ruby gem that provides DaisyUI components as Phlex components for Rails applications.

## Code Guidelines

- All components should extend `DaisyuiOnPhlex::Base` class
- Components should be placed in `lib/daisyui_on_phlex/components/` directory
- Follow DaisyUI naming conventions for CSS classes
- Use keyword arguments for component options
- Provide sensible defaults for all options
- All components should support additional HTML attributes via `**attributes`
- Use `merge_classes` helper method for combining CSS classes

## Component Structure

```ruby
module DaisyuiOnPhlex
  module Components
    class ComponentName < DaisyuiOnPhlex::Base
      def initialize(option: default_value, **attributes)
        @option = option
        @attributes = attributes
      end

      def view_template(&block)
        # Component implementation
      end

      private

      def component_classes
        # Build CSS classes based on options
      end
    end
  end
end
```

## DaisyUI Integration

- Reference official DaisyUI documentation for component APIs
- Maintain consistency with DaisyUI class naming conventions
- Support all variants and modifiers that DaisyUI provides
- Include proper accessibility attributes where applicable

## Testing

- Write RSpec tests for all components
- Test different variants and options
- Verify generated HTML structure and CSS classes
- Test edge cases and error conditions
