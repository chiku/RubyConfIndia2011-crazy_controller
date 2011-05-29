require 'test_helper'

class ConflictCreationTest < ActiveSupport::TestCase
  test "should have an error when op is absent" do
    conflict_creation  = ConflictCreation.new :op => nil

    assert conflict_creation.invalid?
    assert conflict_creation.errors[:op].present?
  end

  test "should be valid" do
    conflict_creation  = ConflictCreation.new :op => 'op'

    assert conflict_creation.valid?
  end
end
