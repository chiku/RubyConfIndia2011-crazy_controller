require 'test_helper'

class ConflictCreationsControllerTest < ActionController::TestCase
  context "on POST to :create_conflict" do
    context "when op is blank" do
      setup do
        post :create_conflict, :op => ''
      end

      should respond_with(:unprocessable_entity)
      should have_an_error("Are")
    end

    context "when original dn and ocn are blank" do
      setup do
        post :create_conflict, :op => 'op', :dn => '', :ocn => ''
      end

      should respond_with(:unprocessable_entity)
      should have_an_error("You")
    end

    context "when crazy stuff does not exist" do
      setup do
        Factory :crazy_stuff, :which_1 => 'something else'
        post :create_conflict, :op => 'op', :dn => 'dn', :ocn => 'ocn'
      end

      should respond_with(:unprocessable_entity)
      should have_an_error("Really")
    end

    context "when non-conflicted crazy stuff exists via dn" do
      setup do 
        dn = 'dn'
        @crazy_stuff = Factory :crazy_stuff, :conflicted => false, :which_1 => dn
        post :create_conflict, :op => 'op', :dn => dn
      end

      should respond_with(:created)
      should "conflict the crazy stuff" do 
        assert @crazy_stuff.reload.conflicted?
      end
    end

    context "when non-conflicted crazy stuff exists via ocn" do
      setup do 
        ocn = 'ocn'
        @crazy_stuff = Factory :crazy_stuff, :conflicted => false, :which_1 => ocn
        post :create_conflict, :op => 'op', :ocn => ocn
      end

      should respond_with(:created)
      should "conflict the crazy stuff" do 
        assert @crazy_stuff.reload.conflicted?
      end
    end
  end
end
