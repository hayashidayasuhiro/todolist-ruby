class TodosController < ApplicationController
  before_action :load_todos, :only => [:index, :add]

  def index
    @new_todo = Todo.new
  end

  def add
    @new_todo = Todo.create(todo_params)
    @new_todo.status = :incomp
    if @new_todo.save
      redirect_to :action => :index
    else
      render :index
    end
  end

  def search
    @todos = []
    if request.post?
      title = params[:title]
      @todos = Todo.where('title like ?', "%#{title}%")
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.attributes = todo_params
    if @todo.save
      redirect_to :action => :index
    else
      render :edit
    end
  end

  private

    def load_todos
      @todos = Todo.all
    end

    def todo_params
      params.require(:todo).permit(:title, :limited_at)
    end
end