module Objectmaker
    
    # message
    class Message
        
        def getMessage(text)
            json = {
                "text": "#{text}"
            }
            return json
        end
        
        def getPicMessage(text,photo_url)
            
            json = {
                "text": text,
                "photo": {
                    "url": photo_url,
                    "width": 960,
                    "height": 960
                    
                }
            }
            
            return json
            
        end
        
        def getPicMessage2(text,photo_url)
            
            json = {
                "text": text,
                "photo": {
                    "url": photo_url,
                    "width": 960,
                    "height": 3000
                    
                }
            }
            
            return json
            
        end
        
        def getPicMessage3(text,photo_url)
            
            json = {
                "text": text,
                "photo": {
                    "url": photo_url,
                    "width": 960,
                    "height": 1000
                    
                }
            }
            
            return json
            
        end
        
        def getMessageBtn(label,url)
            
            json = {
                "message_button": {
                "label": label,
                "url": url
                    
                }
            }
            
            return json
            
        end
        
    end
    
    # keyboard
    class Keyboard
        
        def getTextKey
            
            json = {
                "type": "text"
            }
            return json
        end
        
        def getBtnKey(*arg)
        
            json = {
              "type": "buttons",
                "buttons": []
            }
            
            arg.each do |a|
                json[:buttons] = a
            end
        
            return json
        
        end
    end
end