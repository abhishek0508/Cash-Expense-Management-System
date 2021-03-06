class Transaction < ApplicationRecord
    belongs_to :account
    has_attached_file :image
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif",'application/pdf']
    validates :amount, :numericality => { :only_integer => true}
end
