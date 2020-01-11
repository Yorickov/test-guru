class Badge < ApplicationRecord
  validates :name, :filename, presence: true
  validates :rule_name, presence: true, uniqueness: {
    scope: :rule_param,
    message: 'has already such combination name - param'
  }
end
