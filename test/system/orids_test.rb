require "application_system_test_case"

class OridsTest < ApplicationSystemTestCase
  setup do
    @orid = orids(:one)
  end

  test "visiting the index" do
    visit orids_url
    assert_selector "h1", text: "Orids"
  end

  test "creating a Orid" do
    visit orids_url
    click_on "New Orid"

    fill_in "D", with: @orid.d
    fill_in "I", with: @orid.i
    fill_in "O", with: @orid.o
    fill_in "R", with: @orid.r
    fill_in "User", with: @orid.user_id
    click_on "Create Orid"

    assert_text "Orid was successfully created"
    click_on "Back"
  end

  test "updating a Orid" do
    visit orids_url
    click_on "Edit", match: :first

    fill_in "D", with: @orid.d
    fill_in "I", with: @orid.i
    fill_in "O", with: @orid.o
    fill_in "R", with: @orid.r
    fill_in "User", with: @orid.user_id
    click_on "Update Orid"

    assert_text "Orid was successfully updated"
    click_on "Back"
  end

  test "destroying a Orid" do
    visit orids_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Orid was successfully destroyed"
  end
end
