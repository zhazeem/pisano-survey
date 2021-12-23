class Survey < ApplicationRecord
  belongs_to :customer
  has_many :survey_questions
  
  validates :name, presence: true
end
