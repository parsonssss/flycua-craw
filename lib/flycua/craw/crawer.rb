module Flycua
    module Crawer
        class PriceCrawer
            include Flycua::Craw
            def initialize
                @today =  Flycua::Mtime.get_time
            end

            def craw_price
                _json_data = get_price_json_data_with(@today)
                @price_calendar = parse_json_data(_json_data)
                raise "craw error" if Flycua::Utils.isNil?(@price_calendar)
                @price_calendar
            end

            def serialization_of_price_calendar
                @price_calendar.to_yaml
            end

            def price_write_to_file
                File.open(@today+'.yaml','w') do |file|
                    file.write(serialization_of_price_calendar)
                end
            end

            def show_calendar
                @price_calendar
            end

            def start
                craw_price
                price_write_to_file
            end

        end
    end
end
