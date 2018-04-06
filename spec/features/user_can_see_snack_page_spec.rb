require 'rails_helper'

feature "When a user visits a snack page" do
  scenario "i can see snack price and name and locations and " do
    sam = Owner.create(name: "Sam's Snacks")
    don = sam.machines.create(location: "Don's Mixed Drinks")
    snack = Snack.create(name: 'Snickers', price: 5)
    snack2 = Snack.create(name: 'kitkat', price: 15)
    don.machine_snacks.create!(snack_id: snack.id)
    don.machine_snacks.create!(snack_id: snack2.id)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content(2)
    expect(page).to have_content(10)

  end

end
