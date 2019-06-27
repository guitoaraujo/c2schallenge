require "application_system_test_case"

class InputsTest < ApplicationSystemTestCase
  setup do
    @input = inputs(:one)
  end

  test "visiting the index" do
    visit inputs_url
    assert_selector "h1", text: "Inputs"
  end

  test "creating a Input" do
    visit inputs_url
    click_on "New Input"

    fill_in "Accessories", with: @input.accessories
    fill_in "Km", with: @input.km
    fill_in "Link", with: @input.link
    fill_in "Message", with: @input.message
    fill_in "Name", with: @input.name
    fill_in "Phone", with: @input.phone
    fill_in "Price", with: @input.price
    fill_in "Vehicle", with: @input.vehicle
    fill_in "Vehicle brand", with: @input.vehicle_brand
    fill_in "Vehicle model", with: @input.vehicle_model
    click_on "Create Input"

    assert_text "Input was successfully created"
    click_on "Back"
  end

  test "updating a Input" do
    visit inputs_url
    click_on "Edit", match: :first

    fill_in "Accessories", with: @input.accessories
    fill_in "Km", with: @input.km
    fill_in "Link", with: @input.link
    fill_in "Message", with: @input.message
    fill_in "Name", with: @input.name
    fill_in "Phone", with: @input.phone
    fill_in "Price", with: @input.price
    fill_in "Vehicle", with: @input.vehicle
    fill_in "Vehicle brand", with: @input.vehicle_brand
    fill_in "Vehicle model", with: @input.vehicle_model
    click_on "Update Input"

    assert_text "Input was successfully updated"
    click_on "Back"
  end

  test "destroying a Input" do
    visit inputs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Input was successfully destroyed"
  end
end
