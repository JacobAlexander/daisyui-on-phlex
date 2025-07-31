# frozen_string_literal: true

RSpec.describe DaisyuiOnPhlex do
  it "has a version number" do
    expect(DaisyuiOnPhlex::VERSION).not_to be nil
  end

  describe DaisyuiOnPhlex::Components::Button do
    it "renders a button with default classes" do
      button = DaisyuiOnPhlex::Components::Button.new
      rendered = button.call
      expect(rendered).to include('class="btn btn-primary"')
      expect(rendered).to include('<button')
    end

    it "renders with primary variant" do
      button = DaisyuiOnPhlex::Components::Button.new(variant: :primary)
      rendered = button.call
      expect(rendered).to include('btn-primary')
    end

    it "renders with different sizes" do
      button = DaisyuiOnPhlex::Components::Button.new(size: :lg)
      rendered = button.call
      expect(rendered).to include('btn-lg')
    end

    it "renders with outline modifier" do
      button = DaisyuiOnPhlex::Components::Button.new(outline: true)
      rendered = button.call
      expect(rendered).to include('btn-outline')
    end
  end

  describe DaisyuiOnPhlex::Components::Alert do
    it "renders an alert with default info variant" do
      alert = DaisyuiOnPhlex::Components::Alert.new
      rendered = alert.call
      expect(rendered).to include('alert-info')
      expect(rendered).to include('<div class="alert alert-info"></div>')
    end

    it "renders with success variant" do
      alert = DaisyuiOnPhlex::Components::Alert.new(variant: :success)
      rendered = alert.call
      expect(rendered).to include('alert-success')
    end
  end

  describe DaisyuiOnPhlex::Components::Badge do
    it "renders a badge with default classes" do
      badge = DaisyuiOnPhlex::Components::Badge.new
      rendered = badge.call
      expect(rendered).to include('class="badge badge-neutral"')
    end

    it "renders with primary variant" do
      badge = DaisyuiOnPhlex::Components::Badge.new(variant: :primary)
      rendered = badge.call
      expect(rendered).to include('badge badge-primary')
    end
  end

  describe DaisyuiOnPhlex::Components::Input do
    it "renders an input with default classes" do
      input = DaisyuiOnPhlex::Components::Input.new
      rendered = input.call
      expect(rendered).to include('class="input input-bordered"')
      expect(rendered).to include('type="text"')
    end

    it "renders with different types" do
      input = DaisyuiOnPhlex::Components::Input.new(type: :email)
      rendered = input.call
      expect(rendered).to include('type="email"')
    end
  end

  describe DaisyuiOnPhlex::Components::Carousel do
    it "renders a carousel with default classes" do
      carousel = DaisyuiOnPhlex::Components::Carousel.new
      rendered = carousel.call
      expect(rendered).to include('class="carousel"')
    end

    it "renders with center alignment" do
      carousel = DaisyuiOnPhlex::Components::Carousel.new(alignment: :center)
      rendered = carousel.call
      expect(rendered).to include('carousel-center')
    end

    it "renders with end alignment" do
      carousel = DaisyuiOnPhlex::Components::Carousel.new(alignment: :end)
      rendered = carousel.call
      expect(rendered).to include('carousel-end')
    end

    it "renders vertical carousel" do
      carousel = DaisyuiOnPhlex::Components::Carousel.new(vertical: true)
      rendered = carousel.call
      expect(rendered).to include('carousel-vertical')
    end

    it "renders vertical carousel with center alignment" do
      carousel = DaisyuiOnPhlex::Components::Carousel.new(alignment: :center, vertical: true)
      rendered = carousel.call
      expect(rendered).to include('carousel-center')
      expect(rendered).to include('carousel-vertical')
    end
  end

  describe DaisyuiOnPhlex::Components::Dropdown do
    it "renders a dropdown with default classes" do
      dropdown = DaisyuiOnPhlex::Components::Dropdown.new
      rendered = dropdown.call
      expect(rendered).to include('class="dropdown dropdown-bottom"')
    end

    it "renders with different positions" do
      dropdown = DaisyuiOnPhlex::Components::Dropdown.new(position: :top)
      rendered = dropdown.call
      expect(rendered).to include('dropdown-top')
    end

    it "renders with end alignment" do
      dropdown = DaisyuiOnPhlex::Components::Dropdown.new(align: :end)
      rendered = dropdown.call
      expect(rendered).to include('dropdown-end')
    end

    it "renders with hover trigger" do
      dropdown = DaisyuiOnPhlex::Components::Dropdown.new(hover: true)
      rendered = dropdown.call
      expect(rendered).to include('dropdown-hover')
    end

    it "renders force opened" do
      dropdown = DaisyuiOnPhlex::Components::Dropdown.new(force_open: true)
      rendered = dropdown.call
      expect(rendered).to include('dropdown-open')
    end
  end

  describe DaisyuiOnPhlex::Components::Drawer do
    it "renders a drawer with default classes" do
      drawer = DaisyuiOnPhlex::Components::Drawer.new
      rendered = drawer.call
      expect(rendered).to include('class="drawer"')
    end

    it "renders with end side" do
      drawer = DaisyuiOnPhlex::Components::Drawer.new(side: :end)
      rendered = drawer.call do |d|
        d.side { "Side content" }
      end
      expect(rendered).to include('drawer-end')
    end

    it "renders drawer toggle" do
      drawer = DaisyuiOnPhlex::Components::Drawer.new
      rendered = drawer.call do |d|
        d.toggle(id: "my-drawer")
      end
      expect(rendered).to include('drawer-toggle')
      expect(rendered).to include('id="my-drawer"')
    end

    it "renders drawer content and side" do
      drawer = DaisyuiOnPhlex::Components::Drawer.new
      rendered = drawer.call do |d|
        d.content { "Main content" }
        d.side { "Side content" }
      end
      expect(rendered).to include('drawer-content')
      expect(rendered).to include('drawer-side')
      expect(rendered).to include('Main content')
      expect(rendered).to include('Side content')
    end
  end

  describe DaisyuiOnPhlex::Components::Collapse do
    it "renders a collapse with default classes" do
      collapse = DaisyuiOnPhlex::Components::Collapse.new
      rendered = collapse.call
      expect(rendered).to include('class="collapse"')
    end

    it "renders expanded collapse" do
      collapse = DaisyuiOnPhlex::Components::Collapse.new(expanded: true)
      rendered = collapse.call
      expect(rendered).to include('collapse-open')
      expect(rendered).to include('open')
    end

    it "renders with arrow" do
      collapse = DaisyuiOnPhlex::Components::Collapse.new(arrow: true)
      rendered = collapse.call
      expect(rendered).to include('collapse-arrow')
    end

    it "renders with plus icon" do
      collapse = DaisyuiOnPhlex::Components::Collapse.new(plus: true)
      rendered = collapse.call
      expect(rendered).to include('collapse-plus')
    end
  end

  describe DaisyuiOnPhlex::Components::Modal do
    it "renders a modal with default classes" do
      modal = DaisyuiOnPhlex::Components::Modal.new(id: "test-modal")
      rendered = modal.call
      expect(rendered).to include('id="test-modal"')
      expect(rendered).to include('modal')
    end

    it "renders visible modal" do
      modal = DaisyuiOnPhlex::Components::Modal.new(id: "test-modal", visible: true)
      rendered = modal.call
      expect(rendered).to include('checked')
    end
  end

  describe DaisyuiOnPhlex::Components::Tooltip do
    it "renders a tooltip with default classes" do
      tooltip = DaisyuiOnPhlex::Components::Tooltip.new(text: "Hover me")
      rendered = tooltip.call
      expect(rendered).to include('tooltip-top')
      expect(rendered).to include('data-tip="Hover me"')
    end

    it "renders with different positions" do
      tooltip = DaisyuiOnPhlex::Components::Tooltip.new(text: "Test", position: :bottom)
      rendered = tooltip.call
      expect(rendered).to include('tooltip-bottom')
    end

    it "renders force opened tooltip" do
      tooltip = DaisyuiOnPhlex::Components::Tooltip.new(text: "Test", force_open: true)
      rendered = tooltip.call
      expect(rendered).to include('tooltip-open')
    end
  end

  describe DaisyuiOnPhlex::Components::Validator do
    it "renders a validator with default classes" do
      validator = DaisyuiOnPhlex::Components::Validator.new
      rendered = validator.call
      expect(rendered).to include('<div')
    end

    it "renders valid state" do
      validator = DaisyuiOnPhlex::Components::Validator.new(state: :valid)
      rendered = validator.call
      expect(rendered).to include('input-success')
    end

    it "renders invalid state" do
      validator = DaisyuiOnPhlex::Components::Validator.new(state: :invalid)
      rendered = validator.call
      expect(rendered).to include('input-error')
    end
  end

  describe DaisyuiOnPhlex::Components::Timeline do
    it "renders a timeline with default classes" do
      timeline = DaisyuiOnPhlex::Components::Timeline.new
      rendered = timeline.call
      expect(rendered).to include('timeline')
    end

    it "renders timeline item with start position" do
      timeline = DaisyuiOnPhlex::Components::Timeline.new
      rendered = timeline.call do |t|
        t.item(timeline_start: true) { "Item content" }
      end
      expect(rendered).to include('timeline-start')
    end

    it "renders timeline item with end position" do
      timeline = DaisyuiOnPhlex::Components::Timeline.new
      rendered = timeline.call do |t|
        t.item(timeline_end: true) { "Item content" }
      end
      expect(rendered).to include('timeline-end')
    end
  end

  describe DaisyuiOnPhlex::Components::Accordion do
    it "renders an accordion with default classes" do
      accordion = DaisyuiOnPhlex::Components::Accordion.new
      rendered = accordion.call
      expect(rendered).to include('join')
      expect(rendered).to include('join-vertical')
    end

    it "renders accordion item expanded" do
      accordion = DaisyuiOnPhlex::Components::Accordion.new
      rendered = accordion.call do |a|
        a.item(expanded: true)
      end
      expect(rendered).to include('collapse-open')
    end
  end
end
