class HabitsController < ApplicationController
  before_action :set_habit, only: [:show, :update, :mark_completed, :destroy]

  def index
    @habits = Habit.all

    render json: @habits
  end

  def show
    render json: @habit
  end

  def create
    new_params = habit_params.merge(user: current_user)
    @habit = Habit.new(new_params)

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

  def mark_completed
    if @habit.date_last_completed == Date.yesterday
      if @habit.current_streak == @habit.longest_streak
        @habit.update(
          date_last_completed: Date.today,
          current_streak: @habit.current_streak + 1,
          longest_streak: @habit.longest_streak + 1,
          total: @habit.total + 1
        )
      else 
        @habit.update(
          date_last_completed: Date.today,
          current_streak: @habit.current_streak + 1,
          total: @habit.total + 1
        )
      end
    elsif @habit.date_last_completed == Date.today 
      nil
    else 
      if @habit.longest_streak == 0
        @habit.update(
          date_last_completed: Date.today,
          current_streak: 1,
          longest_streak: 1,
          total: @habit.total + 1
        )
      else 
        @habit.update(
          date_last_completed: Date.today,
          current_streak: 1,
          total: @habit.total + 1
        )
      end
    end
    render json: @habit
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
      :longest_streak
    )
  end
end
