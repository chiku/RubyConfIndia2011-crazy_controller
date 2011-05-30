class ConflictCreationsController < ApplicationController
  def create_conflict
    conflict_creation = ConflictCreation.new params

    if conflict_creation.valid?
      render :xml => conflict_creation.got_ya, :status => :created
    else
      render_unprocessable_entity(conflict_creation.errors)
    end
  end

  private

  def render_unprocessable_entity(text)
    render :xml => [*text].to_xml(:root => 'errors'), :status => :unprocessable_entity
  end
end
