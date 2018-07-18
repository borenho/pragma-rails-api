class School < ApplicationRecord
  extend Enumerize

  enumerize :school_type, in: SchoolType.all.map(&:slug), slug: true
end
