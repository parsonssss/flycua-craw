require 'pry'
module Flycua
    module Utils
        def self.isNil?(obj)
            obj.length == 0
        end

        def self.specialDealWithArray(array)
            line = array.shift.scan(/\d+/)[0].to_i - 2
            price_diff = array.shift.scan(/\d+/)[0].to_i - array.shift.scan(/\d+/)[0].to_i
            date = getDateWithLine(line)
            {"date": date,"price_diff": price_diff}
        end

        def self.parseDiffFile(filename)
            File.open(filename,'r') do |file|
                price_diff = Array.new
                content = file.readlines
                content.map!(&:strip)
                content.delete_if {|item| item == '---'}
                for _ in (0...content.length/3)
                    price_diff << (specialDealWithArray(content))
                end
                price_diff
            end
        end

        def self.getDateWithLine(line)
            file = File.open(Flycua::Mtime.get_time+'.yaml','r').readlines
            file[line].scan(/\d+-\d+-\d+/)[0]
        end

    end
end
