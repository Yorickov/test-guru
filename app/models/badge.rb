class Badge < ApplicationRecord
  validates :title, :filename, :rule_name, presence: true
  validates :rule_name, uniqueness: true,
                        if: proc { |b| b.rule_param.blank? }
  validates :rule_name, uniqueness: { scope: :rule_param },
                        unless: proc { |b| b.rule_param.blank? }
end
