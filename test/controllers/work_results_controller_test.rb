require 'test_helper'

class WorkResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_result = work_results(:one)
  end

  test "should get index" do
    get work_results_url
    assert_response :success
  end

  test "should get new" do
    get new_work_result_url
    assert_response :success
  end

  test "should create work_result" do
    assert_difference('WorkResult.count') do
      post work_results_url, params: { work_result: { revision: @work_result.revision, writing: @work_result.writing } }
    end

    assert_redirected_to work_result_url(WorkResult.last)
  end

  test "should show work_result" do
    get work_result_url(@work_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_result_url(@work_result)
    assert_response :success
  end

  test "should update work_result" do
    patch work_result_url(@work_result), params: { work_result: { revision: @work_result.revision, writing: @work_result.writing } }
    assert_redirected_to work_result_url(@work_result)
  end

  test "should destroy work_result" do
    assert_difference('WorkResult.count', -1) do
      delete work_result_url(@work_result)
    end

    assert_redirected_to work_results_url
  end
end
