class Company < ActiveRecord::Base
has_many :freebies
has_many :devs, through: :freebies

    def freebies
        Freebie.where(company_id: self.id)
    end
   def devs
    Dev.where(id: self.freebies.pluck(:dev_id))
   end

   def self.oldest_company
    self.order(founding_year: :asc).limit(1)
   end


end
