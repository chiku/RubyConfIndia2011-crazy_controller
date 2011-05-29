class CrazyStuff < ActiveRecord::Base
  attr_accessor :op, :dn, :ocn

  validates_uniqueness_of :which_1
  validate :absence_of_op_when_not_conflicted
  validates_presence_of :op, :if => 'conflicted'

  def conflict_with(conflicter)
    update_attributes(:conflicted => true, :op => conflicter)
  end

  private

  def absence_of_op_when_not_conflicted
    if not conflicted? and op.present?
      errors[:op] << "is not conflicted"
    end
  end
end
