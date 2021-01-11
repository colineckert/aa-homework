class Corgi < ApplicationRecord
  validates :name, presence: true
  include Toyable
end
