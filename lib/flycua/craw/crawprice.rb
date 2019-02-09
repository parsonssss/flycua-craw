module Flycua
    module Craw
        def get_price_json_data_with(date)
            #return a json'data which has been marshal
            resp = HTTP.post("https://m.flycua.com/h5/pip/book/PriceCalender.json",
                             :json => {:odInfo => [{"orgCode":"FUO",
                                                    "dstCode":"PVG",
                                                    "takeoffTime":"#{date}",
                                                    "ioBount":"O"}]})
            resp
        end

        def parse_json_data(resp)
            #return many item like this {"day"=>"2019-03-23", "price"=>"448", "week"=>"星期六"} in a Array
            marshal_data = resp.to_s
            price_json_data = JSON.parse(marshal_data)
            #price_json_data["priceCalenders"][0]["priceCalenderBos"].delete_if {|item| item["price"] == '-' }
            price_json_data.fetch("priceCalenders",[{}])[0].fetch("priceCalenderBos",[]).delete_if {|item| item["price"] == '-' }
        end

    end
end
