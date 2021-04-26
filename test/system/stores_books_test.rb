require "application_system_test_case"

class StoresBooksTest < ApplicationSystemTestCase
  setup do
    @stores_book = stores_books(:one)
  end

  test "visiting the index" do
    visit stores_books_url
    assert_selector "h1", text: "Stores Books"
  end

  test "creating a Stores book" do
    visit stores_books_url
    click_on "New Stores Book"

    click_on "Create Stores book"

    assert_text "Stores book was successfully created"
    click_on "Back"
  end

  test "updating a Stores book" do
    visit stores_books_url
    click_on "Edit", match: :first

    click_on "Update Stores book"

    assert_text "Stores book was successfully updated"
    click_on "Back"
  end

  test "destroying a Stores book" do
    visit stores_books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stores book was successfully destroyed"
  end
end
