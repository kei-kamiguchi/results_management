require "application_system_test_case"

class WorkResultsTest < ApplicationSystemTestCase
  setup do
    @work_result = work_results(:one)
  end

  test "visiting the index" do
    visit work_results_url
    assert_selector "h1", text: "Work Results"
  end

  test "creating a Work result" do
    visit work_results_url
    click_on "New Work Result"

    fill_in "Revision", with: @work_result.revision
    fill_in "Writing", with: @work_result.writing
    click_on "Create Work result"

    assert_text "Work result was successfully created"
    click_on "Back"
  end

  test "updating a Work result" do
    visit work_results_url
    click_on "Edit", match: :first

    fill_in "Revision", with: @work_result.revision
    fill_in "Writing", with: @work_result.writing
    click_on "Update Work result"

    assert_text "Work result was successfully updated"
    click_on "Back"
  end

  test "destroying a Work result" do
    visit work_results_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work result was successfully destroyed"
  end
end
