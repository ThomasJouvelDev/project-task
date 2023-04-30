class RecurringTasksController < ApplicationController
  before_action :set_recurring_task, only: %i[ show edit update destroy ]

  def index
    @recurring_tasks = RecurringTask.all.order(:created_at)
  end

  def show
  end

  def new
    @recurring_task = RecurringTask.new
    @goals = Goal.all.order(:created_at).map { |t| [t.title, t.id]}
  end

  def edit
    @goals = Goal.all.order(:created_at).map { |t| [t.title, t.id]}
  end

  def create
    @recurring_task = RecurringTask.new(recurring_task_params)

    respond_to do |format|
      if @recurring_task.save
        format.html { redirect_to recurring_task_url(@recurring_task), notice: "RecurringTask was successfully created." }
        format.json { render :show, status: :created, location: @recurring_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recurring_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recurring_task.update(recurring_task_params)
        format.html { redirect_to recurring_tasks_path, notice: "RecurringTask was successfully updated." }
        format.json { render :show, status: :ok, location: @recurring_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recurring_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recurring_task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "RecurringTask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_recurring_task
    @recurring_task = RecurringTask.find(params[:id])
  end

  def recurring_task_params
    params.require(:recurring_task).permit(:name, :content, :goal_id, :recurrence)
  end
end
