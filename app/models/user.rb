<<<<<<< c1d4ec6b3d9de6a5800eab220d35830a099fd1bc
  class User < ApplicationRecord
          attr_accessor :remember_token       # NEW LINE
          before_save { self.email = email.downcase }
         

          # ALL NEW METHODS
          def User.digest(string)
            cost = ActiveModel::SecurePassword.min_cost ?    
                        BCrypt::Engine::MIN_COST :
                        BCrypt::Engine.cost
            BCrypt::Password.create(string, cost: cost)
          end

          def User.new_token
            SecureRandom.urlsafe_base64
          end

          def remember
            self.remember_token = User.new_token
            update_attribute(:remember_digest, 
                        User.digest(remember_token))
          end

          def authenticated?(remember_token)
            BCrypt::Password.new(remember_digest).is_password?(remember_token)
          end 

           def forget
              update_attribute(:remember_digest, nil)
           end  
     end
=======
class User < ApplicationRecord
    has_many :microposts, dependent: :destroy
     before_save { self.email = email.downcase }
     validates :name, presence: true, length: { in: 9..30 }
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, presence: true, 
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
      validates :password, presence: true, length: { minimum: 6 }
      has_secure_password
    def feed
        Micropost.where("user_id = ?", id)
      end  
end
>>>>>>> User microposting feature
