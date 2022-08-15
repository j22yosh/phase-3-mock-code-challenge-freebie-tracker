class Dev < ActiveRecord::Base
has_many :freebies
has_many :companies, through: :freebies

def freebies
    Freebie.where(dev_id: self.id)
end
def companies
Company.where(id: self.freebies.pluck(:company_id))
end

end
