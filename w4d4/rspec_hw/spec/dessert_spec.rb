require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Boyardee") }
  subject(:cake) {Dessert.new("cake", 20, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
      
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(20)
    end
    
    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect { Dessert.new('cake', '20', chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cake.ingredients).to_not include('butter')
      cake.add_ingredient('butter')
      expect(cake.ingredients).to include('butter')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = %w(chocalate butter milk eggs)
      ingredients.each {|ingredient| cake.add_ingredient(ingredient)}
      cake.mix!
      # expect cake to receive mix!
      expect(cake.ingredients).to_not eq(ingredients)
      expect(cake.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do

    it "subtracts an amount from the quantity" do
      cake.eat(5)
      expect(cake.quantity).to eq(15)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {cake.eat(30)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Boyardee the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
