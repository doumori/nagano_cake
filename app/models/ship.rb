class Ship < ApplicationRecord
  belongs_to :customer

  def view_ship_code
    self.code.to_s
  end

  def view_ship_address
    self.address.to_s
  end

  def view_ship_name
    self.name.to_s
  end

  def view_ship_full
    self.code. + self.address. + self.name.to_s
  end
end
