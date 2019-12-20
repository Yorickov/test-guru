class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def url
    prefix = 'https://gist.github.com/'
    "#{prefix}#{gist_hash}"
  end
end
