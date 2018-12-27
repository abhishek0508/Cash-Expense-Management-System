class Account < ApplicationRecord
    belongs_to :users

    validates :name,  presence: true, length: { maximum: 50 }
end
