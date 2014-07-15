module Edgi
  class Edge
    attr_accessor :id, :source, :target
    def initialize(id: nil, source:, target:, **options)
      @id = id.nil? ? object_id.to_s(36) : id.to_s
      @source = source
      @target = target
      @options = options
    end

    def [](attribute)
      @options.fetch(attribute)
    end
  end
end