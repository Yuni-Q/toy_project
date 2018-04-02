# bus

API를 사용해 보면 추후에 프로젝트에 도움이 될 것이라는 생각에서 시작하게 된 가벼운 API 사용 프로젝트 입니다.

공공데이터 포털의 API 활용

```ruby
busStationName = URI.encode(busStationName)
```

> 인코딩 (한글을 URI로)

```ruby
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
```

> css를 돌면서 배열에 넣고
>
> bus1 과 bus2를 합친 후
>
> 짝 맞춰서 출력한다 !!