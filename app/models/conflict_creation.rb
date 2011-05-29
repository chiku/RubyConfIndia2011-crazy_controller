class ConflictCreation
  include ActiveModel::Validations

  attr_accessor :op

  validates_presence_of :op

  def initialize(options = {}) 
    @op  = options[:op]
  end
end
