class User
  class Upserter
    attr_reader :name, :uid, :picture_url

    def initialize attributes
      @name = attributes['info']['name']
      @picture_url = attributes['info']['image']
      @uid = attributes['uid']
    end

    def perform
      User.find_or_create_by(name: name, uid: uid)
    end
  end
end