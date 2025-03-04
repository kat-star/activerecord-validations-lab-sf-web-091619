class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait_y?

  def clickbait_y?
    if !title.nil? && !title.include?("Won't Believe" || "Secret" || "Guess" || "Top")
      errors.add(:title, 'is not clickbait-y') 
    end
  end

end
