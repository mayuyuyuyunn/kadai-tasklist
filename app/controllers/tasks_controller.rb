class TasksController < ApplicationController
    
    def index
        @tasks = Task.all
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
            flash[:success] = "タスクを保存しました！"
            redirect_to @task
            
        else
            flash.now[:danger] = "タスクの保存に失敗しました！"
            render :new
        end
        
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        
        if @task.update(task_params)
            flash[:success] = "タスクを更新しました！"
            redirect_to @task
            
        else
            flash[:danger] = "タスクの更新に失敗しました！"
            render :edit
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        flash[:success] = "タスクが正常に削除されました！"
        redirect_to tasks_url
    end
    
    private

    #Strong Parameter
    def task_params
    params.require(:task).permit(:content, :status)
    end

end


