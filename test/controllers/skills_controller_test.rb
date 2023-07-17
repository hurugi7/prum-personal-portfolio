require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
     @user = users(:michael)
     @other_user = users(:thomas)
     @user_skill = skills(:ruby)
     @other_user_skill = skills(:php)
  end

  test "should redirect create when not logged in" do
    post skills_path, params: { skills: { name: @user_skill.name,
                                          level: @user_skill.level } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    delete skill_path(@user_skill)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as wrong user" do
    log_in_as(@user)
    delete skill_path(@other_user_skill)
    assert_response :see_other
    assert_redirected_to root_url
  end

end
