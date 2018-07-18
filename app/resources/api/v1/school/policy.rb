module API
  module V1
    module School
      class Policy < Pragma::Policy::Base
        class Scope < Pragma::Policy::Base::Scope
          def resolve
            scope.where('1 = 0')
          end
        end

        def show?
          false
        end

        def create?
          false
        end

        def update?
          false
        end

        def destroy?
          false
        end
      end
    end
  end
end
