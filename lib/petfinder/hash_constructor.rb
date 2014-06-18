module Petfinder

  module HashConstructor

    def initialize(args={})
      args.each{ |key, value| send "#{to_snake_case(key)}=", value }
    end

    def to_snake_case(str)
      # Let's be honest, I didn't write that regex
      str.to_s.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end
  end
end
