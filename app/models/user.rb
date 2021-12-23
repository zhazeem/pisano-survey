class User < ApplicationRecord
  has_many :user_surveys
  
  validates :first_name, :last_name, presence: true

  after_create :generate_auth_token

  private
    def generate_auth_token
      update(auth_token: JsonWebToken.encode(user: { id: id }))
    end
end
