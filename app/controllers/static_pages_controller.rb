class StaticPagesController < ApplicationController
  before_action :redirect_if_logged_in
  
  def home
    @months = [
                Date.today.months_ago(2).strftime("%B"),
                Date.today.last_month.strftime("%B"),
                Date.today.strftime("%B")
              ]
    @back_chart = [0, 0, 0]
    @front_chart = [0, 0, 0]
    @infra_chart = [0, 0, 0]
  end
end
