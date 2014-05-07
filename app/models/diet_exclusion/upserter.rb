class DietExclusion
  class Upserter
    attr_reader :user_id, :exclusions

    def initialize attributes
      @user_id = attributes[:user_id]
      @exclusions = attributes[:exclusions] || []
    end

    def perform
      delete_exclusions
      create_new_exclusions
    end

    def delete_exclusions
      exclusions_to_delete.each do |exclusion|
        delete(exclusion)
      end
    end

    def create_new_exclusions
      new_exclusions.each do |exclusion|
        create(exclusion)
      end
    end

    def create(exclusion)
      DietExclusion.create(type: exclusion, user_id: user_id)
    end

    def delete(exclusion)
      DietExclusion.where(type: exclusion, user_id: user_id).first.delete
    end

    def new_exclusions
      @new_exclusions ||= exclusions.select do |exclusion|
        !found_exclusion(exclusion)
      end
    end

    def existing_exclusions
      DietExclusion.where(user_id: user_id).pluck(:type)
    end

    def exclusions_to_delete
      existing_exclusions - (exclusions - new_exclusions)
    end

    def found_exclusion(exclusion)
      DietExclusion.where(user_id: user_id, type: exclusion).first
    end
  end
end
