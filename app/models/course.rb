class Course < ActiveRecord::Base
  def published?
    published_at?
  end

  def publish!
    touch :published_at
  end

  def unpublish!
    self.published_at = nil
    save!
  end
end
