module Flycua
    module Diff
        def self.getDiffPrice
            Flycua::Utils.parseDiffFile('price.diff')
        end
    end
end
