require "application_system_test_case"

class ClicksTest < ApplicationSystemTestCase
  setup do
    @click = clicks(:one)
  end

  test "visiting the index" do
    visit clicks_url
    assert_selector "h1", text: "Clicks"
  end

  test "should create click" do
    visit clicks_url
    click_on "New click"

    fill_in "Address", with: @click.address
    fill_in "Name", with: @click.name
    click_on "Create Click"

    assert_text "Click was successfully created"
    click_on "Back"
  end

  test "should update Click" do
    visit click_url(@click)
    click_on "Edit this click", match: :first

    fill_in "Address", with: @click.address
    fill_in "Name", with: @click.name
    click_on "Update Click"

    assert_text "Click was successfully updated"
    click_on "Back"
  end

  test "should destroy Click" do
    visit click_url(@click)
    click_on "Destroy this click", match: :first

    assert_text "Click was successfully destroyed"
  end
end
