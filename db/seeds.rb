# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Task.destroy_all
Goal.destroy_all
RecurringTask.destroy_all

Goal.create!(
  [
    {
      title: "Poor goal",
      reward: "Poor reward",
      classification: Goal::CLASSIFICATION_POOR,
      completion: Random.new.rand(101)
    },
    {
      title: "Common goal",
      reward: "Common reward",
      classification: Goal::CLASSIFICATION_COMMON,
      completion: Random.new.rand(101)
    },
    {
      title: "Uncommon goal",
      reward: "Uncommon reward",
      classification: Goal::CLASSIFICATION_UNCOMMON,
      completion: Random.new.rand(101)
    },
    {
      title: "Rare goal",
      reward: "Rare reward",
      classification: Goal::CLASSIFICATION_RARE,
      completion: Random.new.rand(101)
    },
    {
      title: "Epic goal",
      reward: "Epic reward",
      classification: Goal::CLASSIFICATION_EPIC,
      completion: Random.new.rand(101)
    },
    {
      title: "Legendary goal",
      reward: "Legendary reward",
      classification: Goal::CLASSIFICATION_LEGENDARY,
      completion: Random.new.rand(101)
    },
  ]
)

goal_with_task = Goal.create!(title: "Goal with tasks", reward: 'A reward', classification: Goal::CLASSIFICATION_EPIC)
tasks = Task.create!(
  [
    {
      name: "Première",
      content: "La première tâche de l'objectif",
      due_date: 2.days.ago
    },
    {
      name: "Deuxième",
      content: "La deuxième tâche de l'objectif",
      due_date: Time.zone.today
    },
    {
      name: "Troisième",
      content: "La troisième tâche de l'objectif",
      due_date: 5.days.from_now
    }
  ]
)

tasks.each do |task|
  GoalTask.create!(task:, goal: goal_with_task)
end

RecurringTask.create!(name: "Tâche récurrente daily", content: "à faire tous les jours", recurrence: 'daily', goal: goal_with_task)
RecurringTask.create!(name: "Tâche récurrente weekly", content: "à faire toutes les semaines", recurrence: 'weekly', goal: goal_with_task)
RecurringTask.create!(name: "Tâche récurrente monthly", content: "à faire tous les mois", recurrence: 'monthly', goal: goal_with_task)

