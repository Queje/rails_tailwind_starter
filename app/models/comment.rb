class Comment < ApplicationRecord
    validates :user_name, presence: true
    validates :body, presence: true, length: { minimum: 3, maximum: 100 }

    belongs_to :idea
    belongs_to :user
end
