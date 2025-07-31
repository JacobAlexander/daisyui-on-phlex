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

      def item(timeline_start: false, timeline_end: false, **attributes, &block)
        li(class: item_classes(timeline_start: timeline_start, timeline_end: timeline_end), **attributes, &block)
      end

      def start(**attributes, &block)
        div(class: "timeline-start", **attributes, &block)
      end

      def middle(**attributes, &block)
        div(class: "timeline-middle", **attributes, &block)
      end

      def timeline_end(**attributes, &block)
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

      def item_classes(timeline_start: false, timeline_end: false)
        classes = []
        classes << "timeline-start" if timeline_start
        classes << "timeline-end" if timeline_end
        merge_classes(*classes)
      end
    end
  end
end
