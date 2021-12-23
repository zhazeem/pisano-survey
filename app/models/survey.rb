# == Schema Information
#
# Table name: surveys
#
#  id          :bigint           not null, primary key
#  name        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint
#
# Indexes
#
#  index_surveys_on_customer_id  (customer_id)
#
class Survey < ApplicationRecord
  belongs_to :customer
  has_many :survey_questions
  
  validates :name, presence: true
end
