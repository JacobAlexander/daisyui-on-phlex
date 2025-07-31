# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Stat < DaisyuiOnPhlex::Base
      def initialize(**attributes)
        @attributes = attributes
      end

      def view_template(&block)
        div(class: "stats shadow", **@attributes, &block)
      end

      def item(**attributes, &block)
        div(class: "stat", **attributes, &block)
      end

      def figure(**attributes, &block)
        div(class: "stat-figure text-secondary", **attributes, &block)
      end

      def title(**attributes, &block)
        div(class: "stat-title", **attributes, &block)
      end

      def value(**attributes, &block)
        div(class: "stat-value", **attributes, &block)
      end

      def desc(**attributes, &block)
        div(class: "stat-desc", **attributes, &block)
      end

      def actions(**attributes, &block)
        div(class: "stat-actions", **attributes, &block)
      end
    end
  end
end
