class ConflictCreationsController < ApplicationController
  def create_conflict
    conflict_creation = ConflictCreation.new params
    if conflict_creation.invalid?
      render_unprocessable_entity(conflict_creation.errors) and return
    end

    if params[:dn].blank? and params[:ocn].blank?
      render_unprocessable_entity("You") and return
    end

    # ... more of these ...

    which_1 = params[:dn] || params[:ocn]
    got_ya = CrazyStuff.find_by_which_1(which_1)

    render_unprocessable_entity("Really") and return unless got_ya

    got_ya.conflict_with params[:op]

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
