class ConflictCreationsController < ApplicationController
  def create_conflict
    conflict_creation = ConflictCreation.new params
    if conflict_creation.invalid?
      render_unprocessable_entity(conflict_creation.errors) and return
    end

    got_ya = conflict_creation.got_ya

    if got_ya.conflicted?
      render :xml => got_ya, :status => :created
    else
      render_unprocessable_entity(got_ya.errors)
    end
  end

  private

  def render_unprocessable_entity(text)
    render :xml => [*text].to_xml(:root => 'errors'), :status => :unprocessable_entity
  end
end
