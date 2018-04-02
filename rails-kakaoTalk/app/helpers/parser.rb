require 'nokogiri'
require 'open-uri'

module Parser
    class Movie
        def rank_movie
            res = open("http://movie.naver.com/movie/sdb/rank/rmovie.nhn")
    
            doc = Nokogiri::HTML(res)
        
            movies = []
            
            # puts doc
            for i in (2..11)
                #old_content > table > tbody > tr:nth-child(2) > td.title > div > a
            	cssText = "#old_content > table > tbody > tr:nth-child(" + i.to_s + ") > td.title > div > a"
            	movie = (i-1).to_s + "위 " + doc.css(cssText).text
            	movies << movie
            end
            
            return movies
        end
        
        def rank_ticketing
            res = open("http://movie.naver.com/movie/sdb/rank/rreserve.nhn")
    
            doc = Nokogiri::HTML(res)
        
            movies = []
            
            # puts doc
            for i in (2..11)
                #boxoffice-section > div > div > ul > div.ranking.card.grid-1.hei-2.top-0.left-0 > div > ol > li:nth-child(19) > a
                #boxoffice-section > div > div > ul > div.ranking.card.grid-1.hei-2.top-0.left-0 > div > ol > li.item.rank2 > a
                
                #old_content > table > tbody > tr:nth-child(2) > td.title > div > a
                #old_content > table > tbody > tr:nth-child(2) > td.reserve_per.ar
            	cssTitle = "#old_content > table > tbody > tr:nth-child(" + i.to_s + ") > td.title > div > a"
            	cssTicket = "#old_content > table > tbody > tr:nth-child(" + i.to_s + ") > td.reserve_per.ar"
            	movie = (i - 1).to_s + "위 " + doc.css(cssTitle).text
                ticket = "<" + doc.css(cssTicket).text + ">"
            	movies << movie + ticket
            end
            
            return movies
        end
    end
    
    class Search
        def rank_search
            res = open("https://www.naver.com/")
    
            doc = Nokogiri::HTML(res)
        
            searchs = []
            
            # puts doc
            for i in (1..10)
                #PM_ID_ct > div.header > div.section_navbar > div.area_hotkeyword.PM_CL_realtimeKeyword_base > div.ah_list.PM_CL_realtimeKeyword_list_base > ul:nth-child(4) > li:nth-child(1) > a.ah_a > span.ah_k
                #PM_ID_ct > div.header > div.section_navbar > div.area_hotkeyword.PM_CL_realtimeKeyword_base > div.ah_list.PM_CL_realtimeKeyword_list_base > ul:nth-child(4) > li:nth-child(2) > a.ah_a > span.ah_k
                #PM_ID_ct > div.header > div.section_navbar > div.area_hotkeyword.PM_CL_realtimeKeyword_base > div.ah_list.PM_CL_realtimeKeyword_list_base > ul:nth-child(4) > li:nth-child(3) > a.ah_a > span.ah_k
                #ul:nth-child(4) > li:nth-child(3) > a.ah_a > span.ah_k
                #ul:nth-child(4) > li:nth-child(" + i.to_s + ") > a.ah_a > span.ah_k
            	cssText = "ul:nth-child(4) > li:nth-child(" + i.to_s + ") > a.ah_a > span.ah_k"
            	search = (i).to_s + "위 " + doc.css(cssText).text
            	searchs << search
            end
            
            return searchs
        end
        
    end
end