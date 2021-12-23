# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Customer < ApplicationRecord
  has_many :surveys
  
  validates :name, presence: true
end
