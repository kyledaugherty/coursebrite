require "rails_helper"

describe Course do
  describe "#published?" do
    it "returns true if the course is published" do
      course = build(:course, published_at: Time.current)

      expect(course.published?).to be true
    end

    it "returns false if the course is not published" do
      course = build(:course, published_at: nil)

      expect(course.published?).to be false
    end
  end

  describe "#publish!" do
    it "makes the course published and records the current date and time" do
      Timecop.freeze(Time.current)
      course = build_stubbed(:course)

      course.publish!

      expect(course.published?).to be true
      expect(course.published_at).to eq(Time.current)
    end
  end

  describe "#unpublish!" do
    it "makes the course unpublished" do
      course = build_stubbed(:course, published_at: Time.current)

      course.unpublish!

      expect(course.published?).to be false
      expect(course.published_at).to be nil
    end
  end
end
