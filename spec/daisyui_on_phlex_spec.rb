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
      expect(rendered).to include('<svg')
    end

    it "renders with success variant" do
      alert = DaisyuiOnPhlex::Components::Alert.new(variant: :success)
      rendered = alert.call
      expect(rendered).to include('alert-success')
      expect(rendered).to include('<svg')
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
end
