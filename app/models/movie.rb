class Movie < ApplicationRecord
    has_many :persons
    has_many :roles
   # def director
    #    Person.where({Movie_id:self.id})
   # end
end
