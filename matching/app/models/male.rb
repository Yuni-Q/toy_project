class Male < ActiveRecord::Base
	serialize :hobbys

	validates :name,
		# 필수 입력
		presence: true,
		# 이름 : 한글 2, 3글자만 가능
		format: { with: /\A[가-힣]{2,3}\z/}


	validates :birthday,
		# 필수 입력
		presence: true,
		# 생년월일 : yyyy-­MM-­dd 포맷 정확히 일치해야함
		format: { with: /\A[0-9]{4}-[0-9]{2}-[0-9]{2}\z/}


	validates :height,
		# 필수 입력
		presence: true,
		# 키 : 160~200 범위의 숫자만 가능
		numericality: { only_integer: true, less_than_or_equal_to: 200, greater_than_or_equal_to: 160 }

	validates :job,
		# 필수 입력
		presence: true,
		# 직업 : 한글, 영문 대소문자 가능, 10자 제한
		length: { maximum: 10}

	validates :location,
		# 필수 입력
		presence: true,
		# 위치 : 경도, 위도 좌표 포맷
		format: { with: /\A[0-9]{1,3}\.[0-9]+,[0-9]{1,3}\.[0-9]+\z/}

	validates :is_fulfilled,
		# 필수 입력
		presence: true

	# 취미 : 해당 키가 없거나(null), 0개일 수 있음






end
