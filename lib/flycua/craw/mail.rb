module Flycua
    module Memail
        require 'sendgrid-ruby'
        include SendGrid
        def self.send_ticket_price(price_calendar,price_diff)       
            mail = Mail.new
            mail.template_id = 'd-05ef06224df242fa9106d1748f7e277a' # a non-legacy template id
            mail.from = Email.new(email: 'Loken@hubi.com')
            subject = 'today ticket price'
            mail.subject = subject
            personalization = Personalization.new
            personalization.add_to(Email.new(email: '1721718880@qq.com', name: 'User'))
            personalization.add_dynamic_template_data({ "ticket" => price_calendar ,"diff" => price_diff})
            mail.add_personalization(personalization)
            sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
            response = sg.client.mail._('send').post(request_body: mail.to_json)
            puts response.status_code   
        end
    end
end
