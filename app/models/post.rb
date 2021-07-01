class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :good_clickbait

    def good_clickbait
        good_titles = ["Won't Believe","Secret","Top 7","Guess"]
        if title && good_titles.none?{|string| title.include?(string)}
            errors.add(:title, "must include one of the folowing " + '"' + good_titles.join('", "')+'"')
            puts self.errors.full_messages
        end
    end
end
