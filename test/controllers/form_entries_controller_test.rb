require "test_helper"

class FormEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @form_entry = form_entries(:one)
  end

  test "should get index" do
    get form_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_form_entry_url
    assert_response :success
  end

  test "should create form_entry" do
    assert_difference('FormEntry.count') do
      post form_entries_url, params: { form_entry: { email: @form_entry.email, form_id: @form_entry.form_id, name: @form_entry.name, phone: @form_entry.phone } }
    end

    assert_redirected_to form_entry_url(FormEntry.last)
  end

  test "should show form_entry" do
    get form_entry_url(@form_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_form_entry_url(@form_entry)
    assert_response :success
  end

  test "should update form_entry" do
    patch form_entry_url(@form_entry), params: { form_entry: { email: @form_entry.email, form_id: @form_entry.form_id, name: @form_entry.name, phone: @form_entry.phone } }
    assert_redirected_to form_entry_url(@form_entry)
  end

  test "should destroy form_entry" do
    assert_difference('FormEntry.count', -1) do
      delete form_entry_url(@form_entry)
    end

    assert_redirected_to form_entries_url
  end
end
