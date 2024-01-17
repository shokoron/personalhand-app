class RecommendedRingsController < ApplicationController
  def show
     @ring_type = params[:ring_type]
  end
end
