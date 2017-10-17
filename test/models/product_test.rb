require "test_helper"

describe Product do
  let(:product) { Product.new }
  let(:tree1) {products(:tree1)}
  let(:tree2) {products(:tree2)}


  it "must have a name" do
    tree1.valid?.must_equal true
    tree1.name = nil
    tree1.valid?.must_equal false
    tree1.save
    tree1.errors.keys.must_include :name
  end

  it "must have a unique name" do
    tree1.name = "Tree2"
    tree1.valid?.must_equal false

  end

  it "must have a price" do
    tree1.valid?.must_equal true
    tree1.price = nil
    tree1.valid?.must_equal false

  end

  it "price must be a number" do
    tree1.valid?.must_equal true
    tree1.price = nil
    tree1.valid?.must_equal false
    tree1.price = "haha"
    tree1.valid?.must_equal false
  end

  it "price must be greater than 0" do
    tree1.valid?.must_equal true
    tree1.price = 1
    tree1.valid?.must_equal true
    tree1.price = 0
    tree1.valid?.must_equal false
    tree1.price = -1
    tree1.valid?.must_equal false

  end

  it "must belong to a user" do

  end

end
