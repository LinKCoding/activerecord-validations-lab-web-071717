class MyValidator < ActiveModel::Validator
  
  CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess",]

  def validate(post)
    unless CLICKBAIT.any? {|clickbait| post.title.include?(clickbait)}
      post.errors[:title] << 'Include some clickbait!'
    end
  end
end
