class TopController < ApplicationController
  def index
    @subscribe = Subscribe.new
  end

  def create
    Subscribe.create(subscribe_params)
  end

  private
  def subscribe_params
    params.require(:subscribe).permit(:name, :email, :telephone, :address,  :lang_level, :job, :comment, :sex, :birth_date, :nationality)
  end


end
