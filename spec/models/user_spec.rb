require 'rails_helper'

RSpec.describe User, type: :model do
  context "account を指定しているとき" do
    it "ユーザーが作られる" do
      user = User.new(name: "foo", account: "foo", email: "foo@example.com")
      # expect(user.valid?).to eq true
      expect(user).to be_valid
    end
  end

  context "account を指定していないとき" do
    it "ユーザー作成に失敗する" do
      user = User.new(name: "foo", email: "foo@example.com")
      expect(user).to be_invalid
      expect(user.errors.details[:account][0][:error]).to eq :blank
    end
  end

  # context "まだ同じ名前の account が存在しないとき" do
  #   it "ユーザーが作られる" do
  #     user = User.new(name: "foo", account: "foo", email: "foo@example.com")
  #     expect(user).to be_valid
  #   end
  # end

  context "すでに同じ名前の account が存在しているとき" do
    it "ユーザー作成に失敗する" do
      User.create!(name: "foo", account: "foo", email: "foo@example.com")
      user = User.new(name: "bar", account: "foo", email: "bar@example.com")

      expect(user).to be_invalid
      expect(user.errors.account[:error]).to eq :taken
    end
  end
end
