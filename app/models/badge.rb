class Badge < ApplicationRecord
  validates :name, :filename, presence: true
  validates :rule_name, presence: true, uniqueness: {
    scope: :rule_param
  }
  validates :rule_name, uniqueness: true, if: proc { |b| b.rule_param.blank? }
end
