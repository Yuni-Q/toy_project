## devise:
[devise-github](https://github.com/plataformatec/devise)
1. devise 설치
    1) gem install
        * Gemfile에서
        ```ruby
        gem 'devise'
        ```
        ```bash
        bundle install
        ```
        ```bash
        rails generate devise:install
        ```
        * config/environments/development.rb에서
        ```ruby
        config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
        ```
        ```bash
        rails generate devise MODEL
        ```
        ```bash
        rails db:migrate
        ```
        2) Letter Opener 사용
        * Gemfile에서
        ```ruby
        gem 'letter_opener', group: :development
        ```
        * config/environments/development.rb에서
        ```ruby
        config.action_mailer.delivery_method = :letter_opener
        ```
        3) 'bootstrap-sass'젬의 셋업 및 사용법
        * application.css.scss에서
        ```ruby
        @import "bootstrap/theme";
        ```
        4) 자바스크립트 셋업
        // Loads all Bootstrap javascripts
        //= require bootstrap
        
        5) simple_form 젬 셋업
        ```bash
        rails g simple_form:install --bootstrap
        ```
        
        6)layout 수정
        ``` ruby
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
        
        <body>
        <p class="notice"><%= notice %></p>
        <p class="alert"><%= alert %></p>

        <%= yield %>
        
        7) 이메일로 본인 확인을 위해
        db/migrate/20140528023115_devise_create_users.rb 파일을 열고 아래와 같이 ## Confirmable 부분 아래의 네 줄과 하단의 세번째 add_index 부분의 커멘트 처리 부호를 제거하여 마이그레이션 작업시 실행되도록 한다. 그리고 User 모델 클래스에서 아래에 관련 strategy(:confirmable)를 추가한다.
        
        

</body>
        
        
2. devise 사용하기 
    1) Devise는 컨트롤러 및 뷰 내부에서 사용할 수있는 도우미를 만듭니다. 사용자 인증을 사용하여 컨트롤러를 설정하려면이 before_action을 추가하십시오 (사용자의 모델이 '사용자'라고 가정).
    ```ruby
    before_action : authenticate_user!
    ```
    * Rails 5의 경우 protect_from_forgery에는 더 이상 before_action체인에 추가되지 않으므로 authenticate_user이전 protect_from_forgery에 설정 한 경우 요청시 "CSRF 토큰 신뢰성을 확인할 수 없습니다."가 표시됩니다. 이 문제를 해결하려면 호출 순서를 변경하거나 사용하십시오 protect_from_forgery prepend: true
    귀하의 개발 모델이 사용자가 아닌 경우 "_user"를 "_yourmodel"로 대체하십시오. 동일한 논리가 아래 지침에 적용됩니다.
    
    *사용자가 로그인했는지 확인하려면 다음 도우미를 사용하십시오.
    ```ruby
    user_signed_in?
    ```
    
    *현재 로그인 한 사용자의 경우이 도우미를 사용할 수 있습니다.
    ```ruby
    current_user
    ```
    
    *이 범위의 세션에 액세스 할 수 있습니다.
    ```ruby
    user_session
    ```
    
    *사용자 계정에 로그인하거나 비밀번호를 업데이트 한 후 Devise는 리디렉션 할 범위가 지정된 루트 경로를 찾습니다. 예를 들어, :user자원을 사용할 때, 자원 user_root_path이 있으면 사용됩니다. 그렇지 않으면 기본값 root_path이 사용됩니다. 즉, 경로 내에 루트를 설정해야합니다.]
    
    *리디렉션 후크를 재정의 after_sign_in_path_for하고 after_sign_out_path_for사용자 정의 할 수도 있습니다 .
    