# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Habit.destroy_all

Habit.create(name: "Drink Water", details: "Drink 2 liters of water per day", user_id: 1, date_last_completed: "2020-07-16", current_streak: 5, longest_streak: 5, total: 5)
Habit.create(name: "Walk", details: "Walk outside for 30 minutes every day", user_id: 1, date_last_completed: "2020-07-29", current_streak: 4, longest_streak: 5, total: 15)
Habit.create(name: "Meditate", details: "Meditate for 10 minutes", user_id: 1, date_last_completed: "2020-07-29", current_streak: 3, longest_streak: 3, total: 4)
Habit.create(name: "Read More", details: "Read for at least 15 minutes every day before going to sleep", user_id: 1, date_last_completed: "2020-07-19", current_streak: 15, longest_streak: 21, total: 55)
Habit.create(name: "Don't Snooze", details: "Wake up on the first alarm without snoozing!", user_id: 1, date_last_completed: "2020-07-29", current_streak: 11, longest_streak: 11, total: 30)