class Speaker < ApplicationRecord
  belongs_to :event, optional: true
  
  def address
    "#{self.city} #{self.country}"
  end

end
