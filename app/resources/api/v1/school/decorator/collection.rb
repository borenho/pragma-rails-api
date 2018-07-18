module API
  module V1
    module School
      module Decorator
        class Collection < Pragma::Decorator::Base
          include Pragma::Decorator::Type
          include Pragma::Decorator::Collection
          include Pragma::Decorator::Pagination

          decorate_with Instance
        end
      end
    end
  end
end
