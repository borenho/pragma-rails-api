module API
  module V1
    module School
      module Decorator
        class Instance < Pragma::Decorator::Base
          include Pragma::Decorator::Type
        end
      end
    end
  end
end
