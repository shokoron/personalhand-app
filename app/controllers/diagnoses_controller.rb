class DiagnosesController < ApplicationController

  def index
  end

    # 質問1: 指の長さに関する質問
  def question1
    # このアクションでは特にデータベースへの保存は行わないため、
    # 処理は特に必要ありません。
  end

  # 質問2: 指の太さに関する質問
  def question2
    # 質問1からのパラメータをセッションに保存
    session[:long_fingers] = params[:long_fingers]
  end

  # 質問3: 指の形に関する質問
  def question3
    # 質問2からのパラメータをセッションに保存
    session[:thick_fingers] = params[:thick_fingers]
  end

  # 質問4: 水かきの有無に関する質問
  def question4
    # 質問3からのパラメータをセッションに保存
    session[:finger_shape] = params[:finger_shape]
  end

  # 診断結果
  def result
    # 質問4からのパラメータをセッションに保存
    session[:webbed_fingers] = params[:webbed_fingers]

    # 最終的な診断結果の計算
    @diagnosis_result = calculate_result(session)
  end

  private

  def calculate_result(session)
    # パラメータに基づいて診断結果を計算
    if session[:long_fingers] == 'true' && session[:thick_fingers] == 'true' && session[:finger_shape] == 'conical' && session[:webbed_fingers] == 'false'
      'wave'
    # 他の条件分岐はここに続けて記述
    else
      'unknown'
    end
  end
end
