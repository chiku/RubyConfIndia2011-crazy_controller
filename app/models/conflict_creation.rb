class ConflictCreation
  include ActiveModel::Validations

  attr_accessor :op, :dn, :ocn, :got_ya

  validates_presence_of :op, :got_ya
  validate :dn_or_ocn_is_present

  def initialize(options = {})
    @op  = options[:op]
    @dn  = options[:dn]
    @ocn = options[:ocn]

    assign_got_ya
  end

  private

  def assign_got_ya
    which_1 = dn || ocn
    @got_ya = CrazyStuff.find_by_which_1(which_1)
  end

  def dn_or_ocn_is_present
    if not(dn.present? or ocn.present?)
      errors[:base].push "You"
    end
  end
end
