# frozen_string_literal: true

module DaisyuiOnPhlex
  module Components
    class Timeline < DaisyuiOnPhlex::Base
      def initialize(vertical: true, snap: false, compact: false, **attributes)
        @vertical = vertical
        @snap = snap
        @compact = compact
        @attributes = attributes
      end

      def view_template(&block)
        ul(class: timeline_classes, **@attributes, &block)
      end

      def item(start: false, end: false, **attributes, &block)
        li(class: item_classes(start: start, end: end), **attributes, &block)
      end

      def start(**attributes, &block)
        div(class: "timeline-start", **attributes, &block)
      end

      def middle(**attributes, &block)
        div(class: "timeline-middle", **attributes, &block)
      end

      def end(**attributes, &block)
        div(class: "timeline-end", **attributes, &block)
      end

      private

      def timeline_classes
        classes = ["timeline"]
        classes << "timeline-vertical" if @vertical
        classes << "timeline-horizontal" unless @vertical
        classes << "timeline-snap-icon" if @snap
        classes << "timeline-compact" if @compact
        merge_classes(*classes)
      end

      def item_classes(start: false, end: false)
        classes = []
        classes << "timeline-start" if start
        classes << "timeline-end" if end
        merge_classes(*classes)
      end
    end
  end
end
