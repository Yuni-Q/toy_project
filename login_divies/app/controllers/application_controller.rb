class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #보안 끄기
  #protect_from_forgery with: :exception
  # Send 'em back where they came from with a slap on the wrist
  #마지막으로 특정 액션에 대해서 권한이 없는 사용자가 접근을 하게 되면 Security Violation을 표시하는 페이지로 이동하는데 이것을 flash 메시지로 보이도록 하기 위해서 아래와 같이 application_controller.rb 파일의 ApplicationController 클래스 내에 추가한다.
  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, :alert => 'You are not authorized to complete that action.'
  end
end
