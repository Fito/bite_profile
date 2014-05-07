class User < ActiveRecord::Base
  has_many :diet_exclusions
end
