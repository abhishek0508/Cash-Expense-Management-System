class Account < ApplicationRecord
    belongs_to :user
    has_many :transactions
    validates :accname,  presence: true, length: { maximum: 50 }
end
