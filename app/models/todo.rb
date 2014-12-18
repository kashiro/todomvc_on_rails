class Todo < ActiveRecord::Base

  scope :completed, -> { where("completed = ?", true) }
  scope :active, -> { where("completed = ?", false) }

  validates :title, presence: true, length: { maximum: 50 }

  def title=(title)
    write_attribute(:title, title.strip)
  end

end
