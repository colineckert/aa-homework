class Cat < ApplicationRecord
  validates :name, presence: true
  include Toyable
end
