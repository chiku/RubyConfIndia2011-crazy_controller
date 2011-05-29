require 'test_helper'

class ConflictCreationTest < ActiveSupport::TestCase
  test "should have an error when op is absent" do
    conflict_creation = Factory.build :conflict_creation, :op => nil

    assert conflict_creation.invalid?
    assert conflict_creation.errors[:op].present?
  end

  test "should have an error when dn and ocn are absent" do
    conflict_creation = Factory.build :conflict_creation, :dn => '', :ocn => ''

    assert conflict_creation.invalid?
    assert conflict_creation.errors[:base].present?
  end

  test "should be valid via dn" do
    conflict_creation = Factory.build :conflict_creation, :dn => 'dn'

    assert conflict_creation.valid?
  end

  test "should be valid via ocn" do
    conflict_creation = Factory.build :conflict_creation, :ocn => 'ocn'

    assert conflict_creation.valid?
  end
end
