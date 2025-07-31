# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Steps < DaisyuiOnPhlex::Base
      def initialize(vertical: false, **attributes)
        @vertical = vertical
        @attributes = attributes
      end

      def view_template(&block)
        ul(class: steps_classes, **@attributes, &block)
      end

      def step(
        completed: false,
        current: false,
        error: false,
        **attributes,
        &block
      )
        li(class: step_classes(completed: completed, current: current, error: error), **attributes, &block)
      end

      private

      def steps_classes
        classes = ["steps"]
        classes << "steps-vertical" if @vertical
        merge_classes(*classes)
      end

      def step_classes(completed: false, current: false, error: false)
        classes = ["step"]
        classes << "step-primary" if completed
        classes << "step-secondary" if current
        classes << "step-error" if error
        merge_classes(*classes)
      end
    end
  end
end
