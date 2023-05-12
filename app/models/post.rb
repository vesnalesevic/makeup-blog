class Post < ApplicationRecord
    has_many :comments
    has_one_attached :image, service: :local

    def tiny_text
        ActionView::Base.full_sanitizer.sanitize(body).truncate 100
    end
end
