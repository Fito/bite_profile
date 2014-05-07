class DietExclusion < ActiveRecord::Base
  self.inheritance_column = :_type_disabled
  belongs_to :user
end
