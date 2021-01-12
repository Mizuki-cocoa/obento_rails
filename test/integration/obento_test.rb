require 'test_helper'

class ObentoTest < ActionDispatch::IntegrationTest
  # test "Run out of stock" do
  #   post "/session", params: {user_name: "Taro", password: "obento!" }
  #   get "/dishes", params: {box: "3", commit: "送信"}
  #   params: {box: "3", dish:["1", "1", "1"], commit: "送信"}
  #   post "/bentos", params: {box: "3", dish: "1 1 1", sum:"4", commit: "カートに入れる"}
  #   get "/carts", params: {dish:["1", "1", "1"], commit: "送信"}
  #   post "/orders", params: {commit: "注文へ",address:1, date:{"2021-01-11"=>"2021-01-13T00:49"}}
  #   get "/orders/new", params: {address:1, date:{"2021-01-11"=>"2021-01-13T00:49"}, commit: "送信" }
  #   assert_response :redirect
  # end
  test "Login Obento" do
    post "/session", params: {user_name: "Taro", password: "obento!" }
    get "/dishes"
    assert_select 'h1','おかず一覧'
  end

  test "Run out of stock" do
    post "/session", params: {user_name: "Taro", password: "obento!" }
    post "/bentos", params: {box: "3", dish: "1 1 1", sum:"4"}
    post "/orders", params: {address:1, date:{"2021-01-11"=>"2021-01-13T00:49"}}
    assert_response :redirect
    get "/"
    assert_select "p.notice", "注文ミス!"
  end
end