require 'rails_helper'

RSpec.describe Task, type: :model do
  
  describe "バリデーション" do 
    let(:user) { FactoryBot.create :user, :confirmed }
    let(:task) { FactoryBot.create :task, user: user }
    
    context "無効なパターン" do 
      it "is invalid without user" do 
        task = Task.create(
          user: nil, 
          content: "My Content"
          )
          task.valid?
          expect(task.errors[:user]).to include("must exist")
      end
    
      it "is invalid without content" do 
        task = Task.create(
          user: user,
          content: nil
          )
          
          task.valid?
          expect(task.errors[:content]).to include("can't be blank")
      end
    end
    
    context "有効なパターン" do 
      it "is valid with user and content" do 
        expect(task).to be_valid
      end
    end
    
  end
  # ユーザーに紐づいていなければ無効な状態であること
  # it "is invalid without user" do 
    # user = User.new(
    #   email: "example@example.com",
    #   password: "password",
    #   confirmed_at: Time.current
    #   )
    # task = Task.new(
    #   user: user,
    #   content: nil
    #   )
    # task.valid?
    # expect(task.errors[:content]).to include("can't be blank")
    
    
  # end
end
