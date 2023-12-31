require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@exmaple.com",
                     introduce_messages: "こんにちはテストユーザーです。
                     こんにちはテストユーザーです。こんにちはテストユーザーです。
                     こんにちはテストユーザーです。こんにちはテストユーザーです。
                     こんにちはテストユーザーです。こんにちはテストユーザーです。
                     こんにちはテストユーザーです。こんにちはテストユーザーです。
                     こんにちはテストユーザーです。こんにちはテストユーザーです。
                     こんにちはテストユーザーです。こんにちはテストユーザーです。",
                     password: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "introduce_messages should be between 200 charcters and 799 charcters" do
    @user.introduce_messages = "a" * 199
    assert_not @user.valid?
    @user.introduce_messages = "a" * 800
    assert_not @user.valid?
    @user.introduce_messages = "a" * 399
    assert @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@exmaple.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                       first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@exmaple,com user_at_foo.org 
                           user.name@exmaple.foo@baz.com foo@bar+baz.com
                           foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lowercase" do
    mixed_case_email = "Foo@ExAMPle.COm"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = "a" * 5
    assert_not @user.valid?
  end
end
