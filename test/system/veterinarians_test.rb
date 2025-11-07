require "application_system_test_case"

class VeterinariansTest < ApplicationSystemTestCase
  setup do
    @veterinarian = veterinarians(:one)
  end

  test "visiting the index" do
    visit veterinarians_url
    assert_selector "h1", text: "Veterinarians"
  end

  test "should create veterinarian" do
    visit veterinarians_url
    click_on "New veterinarian"

    fill_in "Crm", with: @veterinarian.crm
    fill_in "Name", with: @veterinarian.name
    fill_in "Phone", with: @veterinarian.phone
    click_on "Create Veterinarian"

    assert_text "Veterinarian was successfully created"
    click_on "Back"
  end

  test "should update Veterinarian" do
    visit veterinarian_url(@veterinarian)
    click_on "Edit this veterinarian", match: :first

    fill_in "Crm", with: @veterinarian.crm
    fill_in "Name", with: @veterinarian.name
    fill_in "Phone", with: @veterinarian.phone
    click_on "Update Veterinarian"

    assert_text "Veterinarian was successfully updated"
    click_on "Back"
  end

  test "should destroy Veterinarian" do
    visit veterinarian_url(@veterinarian)
    click_on "Destroy this veterinarian", match: :first

    assert_text "Veterinarian was successfully destroyed"
  end
end
