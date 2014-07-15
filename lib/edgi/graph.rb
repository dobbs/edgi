require 'edgi/node'

module Edgi
  class Graph
    def initialize()
      @nodes = []
      @edges = []
    end

    def node(id:nil, **options)
      if nodes(id:id, **options).empty?
        node = Node.new(id: id, **options)
        @nodes << node
        node
      end
    end

    def nodes(id:nil, **options)
      @nodes.select do |node|
        (id.nil? || id = node.id) &&
        options.all? { |k, v| node[k] == v }
      end
    end

    def edge(id:nil, source:, target:, **options)
      if edges(id: id, source: source, target: target, **options).empty?
        edge = Edge.new(id: id, source: source, target: target, **options)
        @edges << edge
        edge
      end
    end

    def edges(id:nil, source:nil, target:nil, **options)
      @edges.select do |edge|
        (id.nil? || id = edge.id) &&
        (source.nil? || source == edge.source) &&
        (target.nil? || target == edge.target) &&
        options.all? { |k, v| edge[k] == v }
      end
    end
  end
end