class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_snacks

  # yes there's an activerecord way to do that better but i couldn't think of it quickly
  def avg_price
    total = machine_snacks.to_a.sum do |ms|
      ms.snack.price
    end
    total / machine_snacks.count
  end
end
