class SchoolType < ActiveHash::Base
  self.data = [
    { slug: 'university' },
    { slug: 'high_school' },
    { slug: 'primary' }
  ]
end
