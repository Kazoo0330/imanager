require 'test_helper'

class EventDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_day = event_days(:one)
  end

  test "should get index" do
    get event_days_url
    assert_response :success
  end

  test "should get new" do
    get new_event_day_url
    assert_response :success
  end

  test "should create event_day" do
    assert_difference('EventDay.count') do
      post event_days_url, params: { event_day: { day: @event_day.day, end_time: @event_day.end_time, start_time: @event_day.start_time } }
    end

    assert_redirected_to event_day_url(EventDay.last)
  end

  test "should show event_day" do
    get event_day_url(@event_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_day_url(@event_day)
    assert_response :success
  end

  test "should update event_day" do
    patch event_day_url(@event_day), params: { event_day: { day: @event_day.day, end_time: @event_day.end_time, start_time: @event_day.start_time } }
    assert_redirected_to event_day_url(@event_day)
  end

  test "should destroy event_day" do
    assert_difference('EventDay.count', -1) do
      delete event_day_url(@event_day)
    end

    assert_redirected_to event_days_url
  end
end
