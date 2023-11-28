require "test_helper"

class CategoryTest < ActiveSupport::TestCase
    test "can create category with name" do
      category = Category.new
      category.name = "Work"
      assert category.save, "create category with name"
    end

    test "cannot create category without name" do
      category = Category.new
      assert_not category.save, "Missing name"
    end
end
