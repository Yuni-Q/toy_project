require 'rest-client'
require 'nokogiri'


class KakaoController < ApplicationController
  
  @@keyboard = Objectmaker::Keyboard.new
  @@message = Objectmaker::Message.new

  def keyboard
    
    # keyboard = {
    #   :type => "buttons",
    #   :buttons => ["일어나", "원랜디", "영화"]
    #   }
  
    btn_base = ["일어나", "원랜디"]
    btn = btn_base
  
    render json: @@keyboard.getBtnKey(btn)
  
  end

  def message
  
    btn_base = ["일어나", "원랜디"]
    btn_movie = ["네이버 검색 순위", "네이버 영화 랭킹", "네이버 예매 랭킹", "일어나", "잘자"]
    btn_wake_up = ["순위", "로또", "메뉴", "고양이", "시저", "잘자"]
    btn_onepice = ["조합", "스턴", "이감", "방깍", "유닛능력", "스토리 능력", "잘자"]
    btn_ability = ["최종", "전설", "히든", "원랜디", "잘자"]
    
    url_form = "https://fierce-shore-78951.herokuapp.com/"
    
    user_msg = params[:content] # 사용자의 메세지를 받아온다

################################################################################

    if user_msg == "원랜디"
    
      result = "원랜디 8.2 fix1 조합법과 8.0 능력치"
      msg = @@message.getMessage(result)
      btn = btn_onepice
  
    elsif user_msg == "조합"
  
      url = "http://cfile7.uf.tistory.com/image/995C60335A110AFD21757B"
      result = "조합법 입니다."
      msg = @@message.getPicMessage2(result, url)
      btn = btn_onepice
    
    elsif user_msg == "스턴"
  
      url = url_form + "stun.png"
      result = "스턴"
      msg = @@message.getPicMessage3(result, url)
      btn = btn_onepice
  
    elsif user_msg == "이감"

      url = url_form + "slow.png"
      result = "이동속도 감속"
      msg = @@message.getPicMessage3(result, url)
      btn = btn_onepice
      
    elsif user_msg == "방깍"
  
      url = url_form + "dis.png"
      result = "방어력 감소"
      msg = @@message.getPicMessage3(result, url)
      btn = btn_onepice
      
    elsif user_msg == "스토리 능력"

      url = url_form + "story.png"
      result = "스토리 능력"
      msg = @@message.getPicMessage3(result, url)
      btn = btn_onepice
    elsif user_msg == "유닛능력"
      
      result = "어떤 유닛의 능력치를 원하십니까?"
      msg = @@message.getMessage(result)
      btn = btn_ability
      
      ##########################################################################
    elsif user_msg == "최종"
  
      url = url_form + "last.png"
      result = "최종 유닛 능력표"
      msg = @@message.getPicMessage3(result, url)
      btn = btn_ability
  
    elsif user_msg == "전설"

      url = url_form + "legend.png"
      result = "전설 유닛 능력표"
      msg = @@message.getPicMessage3(result, url)
      btn = btn_ability
      
    elsif user_msg == "히든"
  
      url = url_form + "hidden.png"
      result = "히든 유닛 능력표"
      msg = @@message.getPicMessage3(result, url)
      btn = btn_ability
      
################################################################################
  
    elsif user_msg == "순위"
      result = "무슨 순위 ??"
      msg = @@message.getMessage(result)
      btn = btn_movie
  
################################################################################
    elsif user_msg == "네이버 영화 랭킹"
      parser = Parser::Movie.new
      movies = parser.rank_movie
      result = "네이버 영화 순위 \n"
      
      btn_movie_index = []
      
      movies.each do |m|
        result += "\n" + m
        movie_name = m.split("위 ").last
        btn_movie_index.append(movie_name)
      end
      
      btn_movie_index.append("잘자")
      msg = @@message.getMessage(result)
      btn = btn_movie_index
  
    elsif user_msg == "네이버 예매 랭킹"
      parser = Parser::Movie.new
      movies = parser.rank_ticketing
      result = "네이버 영화 예매 순위 \n"
      
      btn_movie_index = []
      
      movies.each do |m|
        result += "\n" + m
        movie_name = m.split("위 ").last
        movie_name = movie_name.split("<").first
        btn_movie_index.append(movie_name)
      end
      
      btn_movie_index.append("잘자")
      msg = @@message.getMessage(result)
      btn = btn_movie_index
################################################################################
    elsif user_msg == "네이버 검색 순위"
      parser = Parser::Search.new
      searchs = parser.rank_search
      result = "네이버 검색 순위 \n"
      
      btn_search_index = []
      
      searchs.each do |m|
        result += "\n" + m
        search_name = m.split("위 ").last
        btn_search_index.append(search_name)
      end
      
      btn_search_index.append("잘자")
      msg = @@message.getMessage(result)
      btn = btn_search_index
  
################################################################################
    
    elsif user_msg == "일어나"
      result = "안녕"
      msg = @@message.getMessage(result)
      btn = btn_wake_up

    elsif user_msg == "로또"
      lotto = [*1..45].sample(6).to_s
      user_lotto = [*1..45].sample(6).to_s
      
      if (lotto !=  user_lotto)
        lotto_result = "성공"
      else
        lotto_result = "실패"
      end
      
      result = "너의 로또 번호는 #{user_lotto} 넌 #{lotto_result} 했어"
      msg = @@message.getMessage(result)
      btn = btn_wake_up

    elsif user_msg == "메뉴"
      menu = ["김밥", "햄버거", "샐러드"]
      result = menu.sample
      msg = @@message.getMessage(result)
      btn = btn_wake_up
    elsif user_msg == "고양이"
      cat = RestClient.get 'http://thecatapi.com/api/images/get?format=xml&results_per_page=1&type=jpg'
      doc = Nokogiri::XML(cat)
      cat_url = doc.xpath("//url").text
      result = "나만 없어 고양이"
      msg = @@message.getPicMessage(result, cat_url)
      btn = btn_wake_up
    
    elsif user_msg == "잘자"
      result = "나는 잠만보다"
      msg = @@message.getMessage(result)
      btn = btn_base

    elsif user_msg == "시저"
      pic = ["https://tumblbug-pci.imgix.net/4c91156c8bb2e286b5bb757da8ee918a5be6de16/c362560e54ee984b0e0aa4e36a901f819e8ab9e2/1e3f50675b45b8ce0d3648dc5f4bac26e1774212/c71feed77687dff205f27755e963239abe2f8b5f.jpg?ixlib=rb-1.1.0&w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&s=58a2b90dbfd18f91c973075edd48ba6d", 
            "https://tumblbug-psi.imgix.net/4c91156c8bb2e286b5bb757da8ee918a5be6de16/c362560e54ee984b0e0aa4e36a901f819e8ab9e2/1e3f50675b45b8ce0d3648dc5f4bac26e1774212/135375de54532c077175178b120ae840453887ea.jpg?ixlib=rb-1.1.0&w=620&auto=format%2C%20compress&lossless=true&ch=save-data&s=d9fbecad7fa5e7ef2ba803ed8818a1da",
            "https://scontent-sea1-1.cdninstagram.com/t51.2885-15/s480x480/e35/19227327_1478378695553201_7689245233808146432_n.jpg?ig_cache_key=MTU0MDY2OTY1NTMwMzkxOTIyMw%3D%3D.2"]
      result = "시저시저"
      msg = @@message.getPicMessage(result, pic.sample)
      btn = btn_wake_up
      
    else
      
      result = user_msg+" 네이버 검색"
      url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query="+user_msg
      msg = @@message.getMessageBtn(result, url)
      
      btn = btn_movie
    
    end
    
    basic_keyboard = @@keyboard.getBtnKey(btn)
    
    basic_msg = {
      message: msg,
      keyboard: basic_keyboard
    }
    
    render json: basic_msg
  
  end
  
  # basic_msg = {
  #   :message => msg,
  #   :keyboard => basic_keyboard
  #   }

  # render json: basic_msg
  # end
################################################################################
  def friend_add
  # 친구 추가
    User.create(
    user_key: params[:user_key],
    chat_room: 0
    )

    render nothing: true
  
    end

  def friend_del

    User.find_by(user_key: params[:user_key]).destroy

    render nothing: true
  end

  def chat_room

    user = User.find_by(user_key: params[:user_key])

    user.plus
    user.save

    render nothing: true
  
  end

################################################################################

end
