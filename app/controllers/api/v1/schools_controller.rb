module API
  module V1
    class SchoolsController < API::V1::ResourceController
      def index
        run API::V1::School::Operation::Index
      end
    end
  end
end
