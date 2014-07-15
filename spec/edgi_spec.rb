require 'edgi'

describe Edgi::Graph do
  let(:graph) { Edgi::Graph.new }

  describe '#node' do
    let(:node) { @node }
    before { @node = graph.node name: 'Lancelot' }

    it 'adds a node' do
      expect(graph.nodes.length).to eq 1
      expect(graph.nodes.first).to eq node
    end

    it 'silently ignores duplicate nodes' do
      expect { graph.node name: 'Lancelot' }.to_not raise_error
      expect { graph.node name: 'Lancelot' }.to_not change { graph.nodes }
    end

    it 'returns a Node with an id' do
      expect(node).to be_a Edgi::Node
      expect(node.id).to be_a String
    end
  end

  describe '#edge' do
    let(:lance) { graph.node name: 'Lancelot' }
    let(:robin) { graph.node name: 'Robin' }
    let(:edge) { @edge }
    before { @edge = graph.edge source: robin, target: lance, relationship: 'envy' }

    it 'adds an edge between two nodes' do
      expect(graph.edges.length).to eq 1
    end

    it 'silently ignores duplicate edges' do
      expect { graph.edge source: robin, target: lance, relationship: 'envy'}.to_not raise_error
      expect { graph.edge source: robin, target: lance, relationship: 'envy'}.to_not change { graph.edges }
    end

    it 'returns an Edge with its index set' do
      expect(edge).to be_a Edgi::Edge
      expect(edge.id).to be_a String
    end
  end

  context 'with a populated graph' do
    let(:his_majesty) { graph.node name: 'Arthur', title: 'King' }
    let(:lancelot) { graph.node name: 'Lancelot', title: 'Sir' }
    let(:the_brave) { graph.node name: 'Robin', title: 'Sir' }
    let(:the_pure) { graph.node name: 'Galahad', title: 'Sir' }

    before do
      graph.edge source: the_brave, target: lancelot, relationship: 'envies'
      graph.edge source: his_majesty, target: lancelot, relationship: 'trusts'
      graph.edge source: the_pure, target: the_brave, relationship: 'ignores'
    end

    describe '#nodes' do
      it 'returns all the nodes in the graph' do
        expect(graph.nodes.length).to eq 4
      end

      context 'with parameters' do
        it 'returns only the matching nodes' do
          matches = graph.nodes(title: 'Sir')
          expect(matches.length).to eq 3
          expect(matches).to_not include his_majesty
          expect(matches).to include [lancelot, the_brave, the_pure].shuffle.first
        end
      end
    end

    describe '#edges' do
      it 'returns all the edges in the graph' do
        expect(graph.edges.length).to eq 3
        expect(graph.edges.map{|e| e.source}).to include [his_majesty, the_brave, the_pure].shuffle.first
      end

      context 'with parameters' do
        it 'returns only the matching nodes' do
          expect(graph.edges(target: lancelot).map(&:source)).to include [the_brave, his_majesty].shuffle.first
        end
      end
    end
  end

end