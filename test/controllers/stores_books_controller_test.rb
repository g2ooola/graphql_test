require "test_helper"

class StoresBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stores_book = stores_books(:one)
  end

  test "should get index" do
    get stores_books_url
    assert_response :success
  end

  test "should get new" do
    get new_stores_book_url
    assert_response :success
  end

  test "should create stores_book" do
    assert_difference('StoresBook.count') do
      post stores_books_url, params: { stores_book: {  } }
    end

    assert_redirected_to stores_book_url(StoresBook.last)
  end

  test "should show stores_book" do
    get stores_book_url(@stores_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_stores_book_url(@stores_book)
    assert_response :success
  end

  test "should update stores_book" do
    patch stores_book_url(@stores_book), params: { stores_book: {  } }
    assert_redirected_to stores_book_url(@stores_book)
  end

  test "should destroy stores_book" do
    assert_difference('StoresBook.count', -1) do
      delete stores_book_url(@stores_book)
    end

    assert_redirected_to stores_books_url
  end
end
