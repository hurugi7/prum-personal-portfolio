require "test_helper"

class UsersEdit < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
end

class UsersEditTest < UsersEdit

  test "unsuccessfull edit introduce_message is too short" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { introduce_messages: "a" * 199 } }
    assert_template 'users/edit'
    assert_select "div.alert", "1件のエラーが発生しました"
  end

  test "unsuccessfull edit introduce_message is too long" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { introduce_messages: "a" * 800 } }
    assert_template 'users/edit'
    assert_select "div.alert", "1件のエラーが発生しました"
  end
end

class ProfileImageUploadTest < UsersEdit
  
  test "should have a file input field for images" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_select 'input[type=file]'
  end

  test "should be able to attach an image" do
    log_in_as(@user)
    img = fixture_file_upload('kitten.jpg', 'image/jpeg')
    patch user_path(@user), params: { user: { avatar_image: img } }
    assert assigns(:user).avatar_image.attached?
  end
end


