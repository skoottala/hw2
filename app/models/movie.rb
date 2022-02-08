class Movie < ApplicationRecord
   has_many :person

   # def director
    #    Person.where({Movie_id:self.id})
   # end
end
