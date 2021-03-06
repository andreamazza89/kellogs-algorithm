require 'kruskal'

RSpec.describe Kruskal do
  describe "#minimum_spanning_tree" do
     it "collects the nodes" do
       edges = {[:a, :b] => 1}
       expect(Kruskal.minimum_spanning_tree(edges)).to eq [[:a, :b]]
     end

     it "lists the edges based on the weight" do
       edges = {[:a, :b] => 2, [:b, :c] => 1}
       expect(Kruskal.minimum_spanning_tree(edges)).to eq [[:b, :c], [:a, :b]]
     end

     it "does not create a loop with 3 nodes" do
       edges = {[:a, :b] => 2, [:b, :c] => 1, [:a, :c] => 3}
       expect(Kruskal.minimum_spanning_tree(edges)).to eq [[:b, :c], [:a, :b]]
     end

    it "does not create a loop with 4 nodes" do
      edges = {[:a, :b] => 1, [:b, :c] => 1, [:a, :d] => 1,
               [:c, :d] => 1, [:b, :d] => 4, [:a, :c] => 4}
      expect(Kruskal.minimum_spanning_tree(edges)).to eq [[:a, :b], [:b, :c], [:a, :d]]
    end

     it "returns the right tree based on actual graph" do
       edges = {[:a, :b] => 3, [:a, :f] => 2, [:b, :d] => 16, [:b, :c] => 17,
                [:c, :d] => 8, [:c, :i] => 18, [:d, :e] => 11, [:d, :i] => 4,
                [:e, :f] => 1, [:e, :i] => 10, [:e, :g] => 6, [:e, :h] => 5,
                [:f, :g] => 7, [:g, :h] => 15, [:h, :i] => 12, [:h, :j] => 13,
                [:i, :j] => 9}
       expect(Kruskal.minimum_spanning_tree(edges))
         .to eq([[:e, :f], [:a, :f], [:a, :b], [:e, :h],
                 [:e, :g], [:d, :i], [:c, :d], [:i, :j], [:e, :i]])
     end

     it "combines two trees correctly" do
       edges = {[:a, :b] => 1, [:b, :c] => 7, [:a, :d] => 7,
                [:c, :d] => 1, [:b, :d] => 7, [:a, :c] => 7}
       expect(Kruskal.minimum_spanning_tree(edges)).to eq([[:a, :b], [:c, :d], [:b, :c]])
     end

  end
end
