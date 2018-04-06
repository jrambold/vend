require 'rails_helper'

feature "When a user visits the vending machine index" do
  scenario "they see a list of vending machine locations" do
    sam = Owner.create(name: "Sam's Snacks")
    sam.machines.create(location: "Don's Mixed Drinks")
    sam.machines.create(location: "Turing Basement")

    visit owner_machines_path(sam)

    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Turing Basement")
  end
end

feature "When a user visits a vending machine page" do
  scenario "they see a list of snacks with price associated with that vending machine" do
    sam = Owner.create(name: "Sam's Snacks")
    don = sam.machines.create(location: "Don's Mixed Drinks")
    snack = Snack.create(name: 'Snickers', price: 5)
    snack2 = Snack.create(name: 'kitkat', price: 15)
    don.machine_snacks.create!(snack_id: snack.id)
    don.machine_snacks.create!(snack_id: snack2.id)

    visit machine_path(don)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack2.price)
  end
  scenario "they see the average price of a snack" do
    sam = Owner.create(name: "Sam's Snacks")
    don = sam.machines.create(location: "Don's Mixed Drinks")
    snack = Snack.create(name: 'Snickers', price: 5)
    snack2 = Snack.create(name: 'kitkat', price: 15)
    don.machine_snacks.create!(snack_id: snack.id)
    don.machine_snacks.create!(snack_id: snack2.id)

    visit machine_path(don)

    expect(page).to have_content(10)
  end
end
