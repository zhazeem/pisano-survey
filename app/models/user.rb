# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  auth_token :string(255)
#  first_name :string(255)      not null
#  last_name  :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_auth_token  (auth_token)
#
class User < ApplicationRecord
  has_many :user_surveys
  
  validates :first_name, :last_name, presence: true

  after_create :generate_auth_token

  private
    def generate_auth_token
      update(auth_token: JsonWebToken.encode(user: { id: id }))
    end
end
