class ConflictCreation
  include ActiveModel::Validations

  attr_accessor :op, :dn, :ocn

  validates_presence_of :op
  validate :dn_or_ocn_is_present

  def initialize(options = {}) 
    @op  = options[:op]
    @dn  = options[:dn]
    @ocn = options[:ocn]
  end

  private

  def dn_or_ocn_is_present
    if not(dn.present? or ocn.present?)
      errors[:base].push "You"
    end
  end
end
