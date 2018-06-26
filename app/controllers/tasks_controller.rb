class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only: [:show, :edit, :update, :destroy, :open, :close]
    
    def index
      @tasks = current_user.tasks
    end
    
    def new
      # buildってなんだろう。引数がないbuildは空の箱を作ってるイメージかな？
      @task = current_user.tasks.build
      @task.attachments.build
    end
    
    def edit
      # before_actionで設定することにしたのでこの記述は不要になった。
      # @task = Task.find(params[:id])
      
    end
    def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        params[:attachments]['location'].each do |loc|
          @attachment = @task.attachments.create!(location: loc)
        end
        flash[:success] = "タスクを生成しました!"
        redirect_to root_url
      else
        # 失敗時の処理
        @task_items = []
        render :new
      end
    end
    
    def update
      if @task.update(task_params)
        params[:attachments]['location'].each do |loc|
          @attachment = @task.attachments.create!(location: loc)
        end
        flash[:success] = "タスクを更新しました！"
        redirect_to root_url
      else
        render :edit
      end
      
    end
    
    def destroy
      @task = current_user.tasks.find_by(id: params[:id])
      @task.destroy
      flash[:success] = "タスクを削除しました。"
      redirect_to request.referrer || root_url
    end
    
    def open 
      @task.open!
      flash[:success] = "タスクの完了を取り消しました。"
      redirect_to root_url
    end
    
    def close 
      @task.closed!
      flash[:success] = "タスクを完了しました。"
      redirect_to root_url
    end
    
    private
      def task_params
        params.require(:task).permit(:content,:description,:deadline, :status)
      end
      
      def set_task
        # @task = Task.find(params[:id])
        @task = current_user.tasks.find(params[:id])
      end
end
