require 'open-uri'
require 'nokogiri'

url = "http://ws.bus.go.kr/api/rest/stationinfo/getStationByName?ServiceKey=hR%2BIhUTRTlL7yitEw348VbxThTyOJ%2F%2FkD%2FnTaZVZjYbnimSclWQR8R4fa4HVJb4GHyWht5%2FCJQGfRccBe%2FNShg%3D%3D&stSrch="
busStationName = "한서병원"
busStationName = URI.encode(busStationName)

busStationNameUrl = url + busStationName

#puts busStationNameUrl

 res = open(busStationNameUrl)

 doc = Nokogiri::XML(res)

 busStationId = doc.css("arsId").text

 puts busStationId

url = "http://ws.bus.go.kr/api/rest/stationinfo/getStationByUid?ServiceKey=hR%2BIhUTRTlL7yitEw348VbxThTyOJ%2F%2FkD%2FnTaZVZjYbnimSclWQR8R4fa4HVJb4GHyWht5%2FCJQGfRccBe%2FNShg%3D%3D&arsId="
busStationInfoUrl = url + busStationId

res = open(busStationInfoUrl)

doc = Nokogiri::XML(res)

bus = []
busStationInfo = doc.css("rtNm").each do |busNum|
	if busNum.text != 0
		bus << busNum.text
	end
end
bus2 = []

busStationInfo2 = doc.css("arrmsg1").each do |busTime|
	bus2 << busTime.text
end

bus3 = Hash[bus.zip(bus2)]

bus3.each do |key, value|
	puts "#{key}의 도착 시간은 #{value}입니다."
end