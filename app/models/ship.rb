class Ship < ApplicationRecord
  belongs_to :customer

  def view_ship
    self.code +  ' '+ self.address + ' ' + self.name.to_s
  end
end
