require 'test_helper'

class AlfredModulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alfred_module = alfred_modules(:one)
  end

  test "should get index" do
    get alfred_modules_url
    assert_response :success
  end

  test "should get new" do
    get new_alfred_module_url
    assert_response :success
  end

  test "should create alfred_module" do
    assert_difference('AlfredModule.count') do
      post alfred_modules_url, params: { alfred_module: { description: @alfred_module.description, homepage: @alfred_module.homepage, license: @alfred_module.license, name: @alfred_module.name } }
    end

    assert_redirected_to alfred_module_url(AlfredModule.last)
  end

  test "should show alfred_module" do
    get alfred_module_url(@alfred_module)
    assert_response :success
  end

  test "should get edit" do
    get edit_alfred_module_url(@alfred_module)
    assert_response :success
  end

  test "should update alfred_module" do
    patch alfred_module_url(@alfred_module), params: { alfred_module: { description: @alfred_module.description, homepage: @alfred_module.homepage, license: @alfred_module.license, name: @alfred_module.name } }
    assert_redirected_to alfred_module_url(@alfred_module)
  end

  test "should destroy alfred_module" do
    assert_difference('AlfredModule.count', -1) do
      delete alfred_module_url(@alfred_module)
    end

    assert_redirected_to alfred_modules_url
  end
end
