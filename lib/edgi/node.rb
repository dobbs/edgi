module Edgi
  class Node
    attr_accessor :id

    def initialize(id:nil, **options)
      @id = id.nil? ? object_id.to_s(36) : id.to_s
      @options = options
    end

    def [](attribute)
      @options.fetch(attribute)
    end
  end
end