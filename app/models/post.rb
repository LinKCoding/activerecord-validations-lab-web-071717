class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :validate_title

  CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]

  def validate_title
    if self.title
      unless CLICKBAIT.any? {|clickbait| self.title.include?(clickbait)}
      self.errors[:title] << 'Include some clickbait!'
      end
    end
  end
end
