# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Button < DaisyuiOnPhlex::Base
      def initialize(
        variant: :primary,
        size: :md,
        outline: false,
        ghost: false,
        link: false,
        active: false,
        disabled: false,
        loading: false,
        wide: false,
        block: false,
        circle: false,
        square: false,
        glass: false,
        no_animation: false,
        **attributes
      )
        @variant = variant
        @size = size
        @outline = outline
        @ghost = ghost
        @link = link
        @active = active
        @disabled = disabled
        @loading = loading
        @wide = wide
        @block = block
        @circle = circle
        @square = square
        @glass = glass
        @no_animation = no_animation
        @attributes = attributes
      end

      def view_template(&block)
        button(
          class: button_classes,
          disabled: @disabled,
          **@attributes,
          &block
        )
      end

      private

      def button_classes
        classes = ["btn"]
        
        # Variant classes
        case @variant
        when :primary then classes << "btn-primary"
        when :secondary then classes << "btn-secondary"
        when :accent then classes << "btn-accent"
        when :neutral then classes << "btn-neutral"
        when :info then classes << "btn-info"
        when :success then classes << "btn-success"
        when :warning then classes << "btn-warning"
        when :error then classes << "btn-error"
        when :ghost then classes << "btn-ghost"
        when :link then classes << "btn-link"
        end

        # Size classes
        case @size
        when :xs then classes << "btn-xs"
        when :sm then classes << "btn-sm"
        when :md then # default, no class needed
        when :lg then classes << "btn-lg"
        end

        # Modifier classes
        classes << "btn-outline" if @outline
        classes << "btn-ghost" if @ghost
        classes << "btn-link" if @link
        classes << "btn-active" if @active
        classes << "btn-disabled" if @disabled
        classes << "loading" if @loading
        classes << "btn-wide" if @wide
        classes << "btn-block" if @block
        classes << "btn-circle" if @circle
        classes << "btn-square" if @square
        classes << "glass" if @glass
        classes << "no-animation" if @no_animation

        merge_classes(*classes)
      end
    end
  end
end
