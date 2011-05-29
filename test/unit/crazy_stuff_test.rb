require 'test_helper'

class CrazyStuffTest < ActiveSupport::TestCase
  test "should have error when which 1 is duplicate" do
    crazy_stuff_original  = Factory :crazy_stuff, :which_1 => 'copy'
    crazy_stuff_duplicate = Factory.build :crazy_stuff, :which_1 => 'copy'

    assert_equal false, crazy_stuff_duplicate.valid?
    assert crazy_stuff_duplicate.errors[:which_1].present?
  end

  test "should have error when conflited without a conflicter" do
    crazy_stuff = Factory.build :crazy_stuff, :op => 'op', :conflicted => false

    assert_equal false, crazy_stuff.valid?
    assert crazy_stuff.errors[:op].present?
  end

  test "should have error when not conflited with a conflicter" do
    crazy_stuff = Factory.build :crazy_stuff, :op => nil, :conflicted => true

    assert_equal false, crazy_stuff.valid?
    assert crazy_stuff.errors[:op].present?
  end

  test "should create a valid crazy stuff" do
    crazy_stuff = Factory.build :crazy_stuff, :which_1 => 'which_1', :op => 'op', :conflicted => true

    assert crazy_stuff.valid?
  end
end
