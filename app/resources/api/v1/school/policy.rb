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
          true
        end

        def create?
          true
        end

        def update?
          true
        end

        def destroy?
          true
        end
      end
    end
  end
end
