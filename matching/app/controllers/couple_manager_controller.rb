class CoupleManagerController < ApplicationController
	# 초기에 값을 불러오는 메소드
	def index
		@male = Male.all.sample
		@female = Female.all.sample

		@one = @male
		@two = @female

		form()
	end

	def name
		info()
		if @one.name > @two.name

			@temp = @one
			@one = @two
			@two = @temp

		end

		form()

	end

	# 생일순으로 정렬하는 메소드
	def birthday
		info()
		if @one.birthday.split("-")[0] > @two.birthday.split("-")[0]

			@temp = @one
			@one = @two
			@two = @temp

		elsif @one.birthday.split("-")[0] == @two.birthday.split("-")[0] and @one.birthday.split("-")[1] > @two.birthday.split("-")[1]
			
			@temp = @one
			@one = @two
			@two = @temp

		elsif @one.birthday.split("-")[0] == @two.birthday.split("-")[0] and @one.birthday.split("-")[1] == @two.birthday.split("-")[1] and @one.birthday.split("-")[2] > @two.birthday.split("-")[2]
			
			@temp = @one
			@one = @two
			@two = @temp

		end

		form()
	end

	# 키순으로 정렬하는 메소드
	def height
		info()
		if @one.height > @two.height

			@temp = @one
			@one = @two
			@two = @temp

		end

		form()

		
	end

	# 직업순으로 정렬하는 메소드
	def job
		info()
		if @one.job > @two.job

			@temp = @one
			@one = @two
			@two = @temp

		end

		form()
		
	end

	# 위치순으로 정렬하는 메소드
	def location

		info()
		if @one.location > @two.location

			@temp = @one
			@one = @two
			@two = @temp

		end

		form()
		
	end

	# 취미순으로 정렬하는 메소드
	def hobbys
		info()
		if @one.hobbys[0] > @two.hobbys[1]

			@temp = @one
			@one = @two
			@two = @temp

		elsif @one.hobbys[0] == @two.hobbys[0] and @one.hobbys[1] > @two.hobbys[1]
			
			@temp = @one
			@one = @two
			@two = @temp

		elsif @one.hobbys[0] == @two.hobbys[0] and @one.hobbys[1] == @two.hobbys[1] and @one.hobbys[2] > @two.hobbys[2]
			@temp = @one
			@one = @two
			@two = @temp


		end

		form()
		
	end

	# 남자우선 정렬하는 메소드
	def male
		info()

		form()
		
	end

	# 여자우선 정렬하는 메소드
	def female
		info()

		@temp = @one
		@one = @two
		@two = @temp

		form()
		
	end
	

	private
		# 필요한 정보를 계산하는 메소드
		def form
			# 두 사람 사이의 거리
			@distance = Math.sqrt((@one.location.split(",")[0].to_i - @two.location.split(",")[0].to_i).abs ** 2 +  (@one.location.split(",")[1].to_i - @two.location.split(",")[1].to_i).abs ** 2)

			# 겹치는 취미의 갯수
			@count = 0
			@two.hobbys.each do |h|
			@one.hobbys.each do |h2|
					if h2 == h 
						@count += 1
					end
				end
			end

			# 나이 차이
			@age = @one.birthday.split("-")[0].to_i - @two.birthday.split("-")[0].to_i

			render template: "couple_manager/layout"

		end

		def info
			# 처음에 불러온 정보를 db에서 다시 찾는 방법
			@one = Male.find(params[:one])
			@two = Female.find(params[:two])
		end

end
