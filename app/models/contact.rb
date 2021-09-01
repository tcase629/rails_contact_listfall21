class Contact < ApplicationRecord
  # Associations - describing relationships
    # - both ways
  # belongs_to - child models, who the parent is 
  
  # parents models
  # has_many - related to multiple records
  # has_one - related to a single record

  # has_many :through - adv
  #   dependent - this will help when we 
  # delete the parent it will delete all 
  # of its children

  has_many :notes, dependent: :destroy
  has_one :address, dependent: :destroy
  # Validations 
  # - Model Validations, stop in the model to 
  # validate data going into the db
  # we are validating the attr, fields of the table / model
  # confirmation 
    # two fields same content
  # inclusion
  #   makes sure its one of the items you give it
  # class Coffee < ActiveRecord::Base
  #   validates :size, inclusion: { 
  #     in: %w(small medium large),
  #       message: "%{value} is not a valid size" 
  #   }
  # end
  # length
    # character count of the value
    # class Person < ActiveRecord::Base
    #   validates :name, length: { minimum: 2 }
    #   validates :bio, length: { maximum: 500 }
    #   validates :password, length: { in: 6..20 }
    #   validates :registration_number, length: { is: 6 }
    # end
    
  # numericality
  #   numeric value
  # class Player < ActiveRecord::Base
  #   validates :points, numericality: true
  #   validates :games_played, numericality: { only_integer: true }
  #   validates :golf_handicap, numericality: { less_than_or_equal_to: 40.4, greater_than_or_equal_to: 2 }
  # end
  # presence
    # makes sure its not empty or null
    # class Person < ActiveRecord::Base
    #   validates :name, :login, :email, presence: true
    # end
  # uniqueness
    # one object that gets save of that value
    # class Account < ActiveRecord::Base
    #   validates :email, uniqueness: true
    # end
    validates :first_name, :last_name, :email, presence: true 
    validates :age, numericality: true
    validates :email, uniqueness: true
  
    # allow nil 
    # allow blank 
    # message
    # on - only run on a action 
  
    # Model Methods / call backs 
  # Call back is to trigger code when an event is run 
  # before_validation
  # after_validation
  # before_save
  # after_save 
  # before_create
  # after_create
  # around_save
  # around_create

  # class CreditCard < ActiveRecord::Base
  #   before_save :encrypt_card_number
   
  #   private
   
  #     def encrypt_card_number
  #       self.card_number = bcrypt(self.card_number)
  #     end
  # end

  # Class method
  # class Person < ActiveRecord::Base
  #   # called on a class Person.by_first_name
  #   def self.by_first_name
  #     order(:first_name)
  #   end
  # end

  # # instance method
  # class Person < ActiveRecord::Base
  #   # called on an instance @person.full_name
  #   def full_name
  #    "#{self.first_name} {self.last_name}"
  #   end
  # end

  # all logic that has to do with the data will be in the model
  # fat models skinny controllers 
  # all logic should be in the model 
  # controllers are handling actions 
  # actions - CRUD, events you can do functionally in the application
end
