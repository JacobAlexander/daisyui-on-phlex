# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Modal < DaisyuiOnPhlex::Base
      def initialize(
        id:,
        visible: false,
        **attributes
      )
        @id = id
        @visible = visible
        @attributes = attributes
      end

      def view_template(&block)
        # Modal trigger (checkbox for CSS-only modal)
        input(
          type: "checkbox",
          id: @id,
          class: "modal-toggle",
          checked: @visible
        )

        # Modal
        div(
          class: "modal",
          role: "dialog"
        ) do
          div(
            class: "modal-box",
            **@attributes,
            &block
          )
          
          # Close modal when clicking outside
          label(
            class: "modal-backdrop",
            for: @id
          )
        end
      end

      def title(css_class: nil, **attributes, &block)
        h3(
          class: merge_classes("text-lg font-bold", css_class),
          **attributes,
          &block
        )
      end

      def action(**attributes, &block)
        div(
          class: "modal-action",
          **attributes,
          &block
        )
      end

      def close_button(text = "Close", **attributes)
        label(
          for: @id,
          class: merge_classes("btn", attributes[:class]),
          **attributes.except(:class)
        ) { text }
      end
    end
  end
end
