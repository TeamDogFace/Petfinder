module Petfinder

  class Photo
    attr_accessor :id, :size, :url

    def initialize(data={})
      @url = data["__content__"].strip
      @size = data["size"]
      @id = data["id"]
    end

  end
end
