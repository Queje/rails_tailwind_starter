class Idea < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 10, maximum: 100 }
    validates :picture, presence: true

    belongs_to :user
    has_many :comments

    mount_uploader :picture, PictureUploader
end
