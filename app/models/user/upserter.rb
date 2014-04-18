class User
  class Upserter
    attr_reader :name, :uid, :picture_url

    def initialize attributes
      @name = attributes['info']['name']
      @picture_url = attributes['info']['image']
      @uid = attributes['uid']
    end

    def perform
      found_user ? update : create
    end

    def attributes
      {
        uid: uid,
        name: name,
        picture_url: picture_url
      }
    end

    def create
      User.create(attributes)
    end

    def update
      found_user.update_attributes(attributes)
      found_user
    end

    def found_user
      @found_user ||= User.where(uid: uid).first
    end
  end
end