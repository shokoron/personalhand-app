class DiagnosesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

    # 質問1: 指の長さに関する質問
  def question1

  end

  # 質問2: 指の太さに関する質問
  def question2
    @long_fingers = params[:long_fingers]
  end

  # 質問3: 指の形に関する質問
  def question3
    @long_fingers = params[:long_fingers]
    @thick_fingers = params[:thick_fingers]
  end

  # 質問4: 水かきの有無に関する質問
  def question4
    @long_fingers = params[:long_fingers]
    @thick_fingers = params[:thick_fingers]
    @finger_shape = params[:finger_shape]
  end

  # 診断結果
  def result
    @long_fingers = params[:long_fingers]
    @thick_fingers = params[:thick_fingers]
    @finger_shape = params[:finger_shape]
    @webbed_fingers = params[:webbed_fingers]

   # Strong Parametersの設定
   def diagnosis_params
     params.permit(
       :long_fingers,
       :thick_fingers,
       :finger_shape,
       :webbed_fingers
     ).merge(user_id: current_user.id)
   end


   # データベースに診断情報を保存
   diagnosis = Diagnosis.new(diagnosis_params)

   if diagnosis.valid? && diagnosis.save
    # データベースに保存されたデータから診断結果を取得
    @diagnosis_result = calculate_result(diagnosis)

    render "result"
   else
    # データの保存に問題がある場合の処理
    flash[:error] = "データの保存中にエラーが発生しました。"
    redirect_to root_path
   end
  end

  private
  def authenticate_user!
    unless current_user
      flash[:alert] = "ログインが必要です。"
      redirect_to new_user_session_path
    end
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