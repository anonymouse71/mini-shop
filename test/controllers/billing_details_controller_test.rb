require 'test_helper'

class BillingDetailsControllerTest < ActionController::TestCase
  setup do
    @billing_detail = billing_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:billing_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create billing_detail" do
    assert_difference('BillingDetail.count') do
      post :create, billing_detail: { additional_information: @billing_detail.additional_information, address: @billing_detail.address, cart_id: @billing_detail.cart_id, city: @billing_detail.city, company: @billing_detail.company, country: @billing_detail.country, email: @billing_detail.email, first_name: @billing_detail.first_name, last_name: @billing_detail.last_name, mobile_phone: @billing_detail.mobile_phone, order_id: @billing_detail.order_id, state: @billing_detail.state, zip_code: @billing_detail.zip_code }
    end

    assert_redirected_to billing_detail_path(assigns(:billing_detail))
  end

  test "should show billing_detail" do
    get :show, id: @billing_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @billing_detail
    assert_response :success
  end

  test "should update billing_detail" do
    patch :update, id: @billing_detail, billing_detail: { additional_information: @billing_detail.additional_information, address: @billing_detail.address, cart_id: @billing_detail.cart_id, city: @billing_detail.city, company: @billing_detail.company, country: @billing_detail.country, email: @billing_detail.email, first_name: @billing_detail.first_name, last_name: @billing_detail.last_name, mobile_phone: @billing_detail.mobile_phone, order_id: @billing_detail.order_id, state: @billing_detail.state, zip_code: @billing_detail.zip_code }
    assert_redirected_to billing_detail_path(assigns(:billing_detail))
  end

  test "should destroy billing_detail" do
    assert_difference('BillingDetail.count', -1) do
      delete :destroy, id: @billing_detail
    end

    assert_redirected_to billing_details_path
  end
end
