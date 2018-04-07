require 'mailgun'

class HomeController < ApplicationController
    def index
    
    end
    
     def write
         @one = params["title"]
         @two = params["receiver"]
         @three = params["content"]
         @every_email = Email.all.order("id desc")
         mg_client = Mailgun::Client.new("key-93f83da9e15b92fc9d7b4cc4cf2c2025")

        message_params =  {
                   from: 'master@likelion.net',
                   to:   @two,
                   subject: @one,
                   text:    @three
                  }

        result = mg_client.send_message('sandbox5d052bd5416442cda3e8089539772afb.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
        
        new_email = Email.new
        new_email.title = params["title"]
        new_email.receiver = params["receiver"]
        new_email.content = params["content"]
        new_email.save
   
    end
end
