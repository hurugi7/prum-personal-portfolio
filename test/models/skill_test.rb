require "test_helper"

class SkillTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @category = categories(:back)
    @skill = @user.skills.build(name: "Ruby", level: 1, category_id: @category.id)
  end

  test "should be valid" do
    assert @skill.valid?
  end

  test "user id and category id should be present" do
    @skill.user_id = nil
    @skill.category_id = nil
    assert_not @skill.valid?
  end
  
  test "name should be present" do
    @skill.name = " "
    assert_not @skill.valid?
  end

  test "name should be at most 30 characters" do
    @skill.name = "a" * 31
    assert_not @skill.valid?
  end

  test "level should be present" do
    @skill.level = " "
    assert_not @skill.valid?
  end

  
end
