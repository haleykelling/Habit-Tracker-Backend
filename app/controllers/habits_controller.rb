class HabitsController < ApplicationController
  before_action :set_habit, only: [:show, :update, :destroy]

  def index
    @habits = Habit.all

    render json: @habits
  end

  def show
    render json: @habit
  end

  def create
    @habit = Habit.new(habit_params)

    if @habit.save
      render json: @habit, status: :created, location: @habit
    else
      render json: @habit.errors, status: :unprocessable_entity
    end
  end

  def update
    if @habit.update(habit_params)
      render json: @habit
    else
      render json: @habit.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @habit.destroy
  end

  private

  def set_habit
    @habit = Habit.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(
      :name, 
      :details, 
      :date_last_completed, 
      :current_streak, 
      :longest_streak, 
      :user_id
    )
  end
end
