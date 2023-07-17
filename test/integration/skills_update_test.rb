require "test_helper"

class SkillsUpdateTest < ActionDispatch::IntegrationTest
  
  def setup
     @user = users(:michael)
     @last_month_skill = skills(:ruby)
     @this_month_skill = skills(:php)
  end

  test "should create skill when skill's updated_at is not between this month" do
    log_in_as(@user)
    get skills_path
    assert_template 'skills/index'
    patch skill_path(@last_month_skill), params: { skill: { name: @last_month_skill.name,
                                                             level: 5 } }
    assert_not flash.empty?
    assert_redirected_to skills_url
  end
end
