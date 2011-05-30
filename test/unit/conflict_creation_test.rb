require 'test_helper'

class ConflictCreationTest < ActiveSupport::TestCase
  test "should have an error when 'op' is absent" do
    conflict_creation = ConflictCreation.new :op => nil

    assert conflict_creation.invalid?
    assert conflict_creation.errors[:op].present?
  end

  test "should have an error when 'dn' and 'ocn' are absent" do
    conflict_creation = ConflictCreation.new :dn => '', :ocn => ''

    assert conflict_creation.invalid?
    assert conflict_creation.errors[:base].present?
  end

  test "should have an error when 'got_ya' is absent" do
    crazy_stuff       = Factory :crazy_stuff, :which_1 => 'something else'
    conflict_creation = ConflictCreation.new :dn => 'dn', :ocn => 'ocn'
    assert conflict_creation.got_ya.nil?

    assert conflict_creation.invalid?
    assert conflict_creation.errors[:got_ya].present?
  end

  test "should be valid via 'dn'" do
    dn                = 'dn'
    crazy_stuff       = Factory :conflicted_crazy_stuff, :which_1 => dn
    conflict_creation = ConflictCreation.new :op => crazy_stuff.op, :dn => dn

    assert conflict_creation.valid?
  end

  test "should be valid via 'ocn'" do
    ocn               = 'ocn'
    crazy_stuff       = Factory :conflicted_crazy_stuff, :which_1 => ocn
    conflict_creation = ConflictCreation.new :op => crazy_stuff.op, :ocn => ocn

    assert conflict_creation.valid?
  end

  test "should properly assign 'got_ya' via 'dn'" do
    dn                = 'dn'
    crazy_stuff       = Factory :crazy_stuff, :which_1 => dn
    conflict_creation = ConflictCreation.new :dn => dn

    assert_equal crazy_stuff, conflict_creation.got_ya
  end

  test "should properly assign 'got_ya' via 'ocn'" do
    ocn               = 'ocn'
    crazy_stuff       = Factory :crazy_stuff, :which_1 => ocn
    conflict_creation = ConflictCreation.new :ocn => ocn

    assert_equal crazy_stuff, conflict_creation.got_ya
  end

  test "should not have 'got_ya' when 'dn' and 'ocn' don't match" do
    crazy_stuff       = Factory :crazy_stuff, :which_1 => 'something else'
    conflict_creation = ConflictCreation.new :dn => 'dn', :ocn => 'ocn'

    assert_equal nil, conflict_creation.got_ya
  end
end
