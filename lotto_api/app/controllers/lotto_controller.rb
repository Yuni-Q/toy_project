class LottoController < ApplicationController
  def show
    @lotto = (1..45).to_a.sample(6)
  end
  def api
    require 'httparty'
    require 'json'
    
    @lotto_number = params[:lotto_number]

    @lotto_number = @lotto_number.split(",")  
    #  fro  @lotto_number[0] = @lotto_number[0].to_i
    #  @lotto_number[1] = @lotto_number[1].to_i
    #  @lotto_number[2] = @lotto_number[2].to_i
    #  @lotto_number[3] = @lotto_number[3].to_i
    #  @lotto_number[4] = @lotto_number[4].to_i
    #  @lotto_number[5] = @lotto_number[5].to_i
    # p @lotto_number

    @lotto_number.map! { |num| num.to_i}
    
    url = "http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo="
    response = HTTParty.get(url)
    result = JSON.parse(response.body) #puts result
    
    @arr = Array.new
    @bonus_number = result['bunsaNo']
    
    result.each do |key, value|
      @arr << value if key.include? "drwtNo"
    end
    
    @matching = @arr & @lotto_number
    
    @matching2 = @bonus_number & @lotto_number
    
    @counting = @matching.length
    
    if @counting == 6
      @result = "1등"
    elsif @counting == 5
      @result = "2등"
    elsif @counting == 4
      @result = "3등"
    elsif @counting == 3
      @result = "4등"
    elsif @counting == 2
      @result = "5등"
    else
      @result = "6등"
    end
  end
end
