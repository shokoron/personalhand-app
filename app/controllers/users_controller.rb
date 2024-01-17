class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  before_action :check_user, only: [:show]

  def show
    @latest_diagnosis = @user.diagnoses.last
    if @latest_diagnosis
       @diagnosis_result = calculate_result(@latest_diagnosis)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_user
    redirect_to(root_path) unless @user == current_user
  end

  def calculate_result(diagnosis)
    case
    when diagnosis.long_fingers? && diagnosis.thick_fingers? && diagnosis.finger_shape == "conical" && !diagnosis.webbed_fingers?
      'wave' # パターン１
    when diagnosis.long_fingers? && !diagnosis.thick_fingers? && diagnosis.finger_shape == "conical" && !diagnosis.webbed_fingers?
      'wave' # パターン２
    when diagnosis.long_fingers? && diagnosis.thick_fingers? && diagnosis.finger_shape == "conical" && diagnosis.webbed_fingers?
      'straight' # パターン３
    when diagnosis.long_fingers? && !diagnosis.thick_fingers? && diagnosis.finger_shape == "conical" && diagnosis.webbed_fingers?
      'straight' # パターン４
    when !diagnosis.long_fingers? && diagnosis.thick_fingers? && diagnosis.finger_shape == "conical" && !diagnosis.webbed_fingers?
      'wave' # パターン５
    when !diagnosis.long_fingers? && !diagnosis.thick_fingers? && diagnosis.finger_shape == "conical" && !diagnosis.webbed_fingers?
      'wave' # パターン６
    when !diagnosis.long_fingers? && diagnosis.thick_fingers? && diagnosis.finger_shape == "conical" && diagnosis.webbed_fingers?
      'v_shape' # パターン７
    when !diagnosis.long_fingers? && !diagnosis.thick_fingers? && diagnosis.finger_shape == "conical" && diagnosis.webbed_fingers?
      'v_shape' # パターン８
    when diagnosis.long_fingers? && diagnosis.thick_fingers? && !(diagnosis.finger_shape == "conical") && !diagnosis.webbed_fingers?
      'straight' # パターン９
    when diagnosis.long_fingers? && !diagnosis.thick_fingers? && !(diagnosis.finger_shape == "conical") && !diagnosis.webbed_fingers?
      'straight' # パターン１０
    when diagnosis.long_fingers? && diagnosis.thick_fingers? && !(diagnosis.finger_shape == "conical") && diagnosis.webbed_fingers?
      'straight' # パターン１１
    when diagnosis.long_fingers? && !diagnosis.thick_fingers? && !(diagnosis.finger_shape == "conical") && diagnosis.webbed_fingers?
      'straight' # パターン１２
    when !diagnosis.long_fingers? && diagnosis.thick_fingers? && !(diagnosis.finger_shape == "conical") && !diagnosis.webbed_fingers?
      'straight' # パターン１３
    when !diagnosis.long_fingers? && !diagnosis.thick_fingers? && !(diagnosis.finger_shape == "conical") && !diagnosis.webbed_fingers?
      'straight' # パターン１４
    when !diagnosis.long_fingers? && diagnosis.thick_fingers? && !(diagnosis.finger_shape == "conical") && diagnosis.webbed_fingers?
      'straight' # パターン１５
    when !diagnosis.long_fingers? && !diagnosis.thick_fingers? && !(diagnosis.finger_shape == "conical") && diagnosis.webbed_fingers?
      'straight' # パターン１６
    else
      'unknown'
    end
  end  
end
