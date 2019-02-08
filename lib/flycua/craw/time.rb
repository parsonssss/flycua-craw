module Flycua
    module Mtime
        def self.get_time
        #return the spec time format: YY-MM-DD
        Time.now.strftime("%Y-%m-%d")
        end
    end
end
