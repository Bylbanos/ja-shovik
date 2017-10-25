class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end


  def save_checkbox
    @challenge = Challenge.find(params[:value])
    render json: "ok: #{params[:value]} = #{params[:checked]}"
  end

end
