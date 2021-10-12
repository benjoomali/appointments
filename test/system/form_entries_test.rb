require "application_system_test_case"

class FormEntriesTest < ApplicationSystemTestCase
  setup do
    @form_entry = form_entries(:one)
  end

  test "visiting the index" do
    visit form_entries_url
    assert_selector "h1", text: "Form Entries"
  end

  test "creating a Form entry" do
    visit form_entries_url
    click_on "New Form Entry"

    fill_in "Email", with: @form_entry.email
    fill_in "Form", with: @form_entry.form_id
    fill_in "Name", with: @form_entry.name
    fill_in "Phone", with: @form_entry.phone
    click_on "Create Form entry"

    assert_text "Form entry was successfully created"
    click_on "Back"
  end

  test "updating a Form entry" do
    visit form_entries_url
    click_on "Edit", match: :first

    fill_in "Email", with: @form_entry.email
    fill_in "Form", with: @form_entry.form_id
    fill_in "Name", with: @form_entry.name
    fill_in "Phone", with: @form_entry.phone
    click_on "Update Form entry"

    assert_text "Form entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Form entry" do
    visit form_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Form entry was successfully destroyed"
  end
end
