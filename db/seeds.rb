# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Users
user1 = User.create!(email: 'user1@example.com', password: 'password123', password_confirmation: 'password123', full_name: 'User One', avatar_url: 'https://example.com/avatar1', provider: 'github', uid: '123456')
user2 = User.create!(email: 'user2@example.com', password: 'password123', password_confirmation: 'password123', full_name: 'User Two', avatar_url: 'https://example.com/avatar2', provider: 'github', uid: '234567')

# Categories
cat1 = Category.create!(name: 'Category 1')
cat2 = Category.create!(name: 'Category 2')
cat3 = Category.create!(name: 'Category 3')

# Projects
project1 = Project.create!(name: 'Project 1', author: user1)
project2 = Project.create!(name: 'Project 2', author: user2)

# Goals
goal1 = Goal.create!(name: 'Goal 1', notes: 'Some notes for Goal 1', project: project1)
goal2 = Goal.create!(name: 'Goal 2', notes: 'Some notes for Goal 2', project: project1)

# Outcomes
outcome1 = Outcome.create!(notes: 'Notes for Outcome 1', name: 'Outcome 1', goal: goal1, project: project1)
outcome2 = Outcome.create!(notes: 'Notes for Outcome 2', name: 'Outcome 2', goal: goal2, project: project1)

# Opportunities
opp1 = Opportunity.create!(name: 'Opportunity 1', source: 0, link: 'https://example.com/opp1', outcome: outcome1, project: project1)
opp2 = Opportunity.create!(name: 'Opportunity 2', source: 1, link: 'https://example.com/opp2', outcome: outcome2, project: project1)

# Ideas
idea1 = Idea.create!(name: 'Idea 1', description: 'Description for Idea 1', comment: 'Comment for Idea 1', attachment: 'attachment1.jpg', status: 0, link: 'https://example.com/idea1', opportunity: opp1, project: project1)
idea2 = Idea.create!(name: 'Idea 2', description: 'Description for Idea 2', comment: 'Comment for Idea 2', attachment: 'attachment2.jpg', status: 1, link: 'https://example.com/idea2', opportunity: opp2, project: project1)

# Experiments
experiment1 = Experiment.create!(name: 'Experiment 1', idea: idea1, description: 'Description for Experiment 1', assumption: 'Assumption 1', validation_technique: 0, metric: 'Metric 1', success_metric: 'Success Metric 1', outcome: 'Outcome for Experiment 1', conclusion: 'Conclusion for Experiment 1', text_steps: 'Text steps for Experiment 1')
experiment2 = Experiment.create!(name: 'Experiment 2', idea: idea2, description: 'Description for Experiment 2', assumption: 'Assumption 2', validation_technique: 1, metric: 'Metric 2', success_metric: 'Success Metric 2', outcome: 'Outcome for Experiment 2', conclusion: 'Conclusion for Experiment 2', text_steps: 'Text steps for Experiment 2')

# Idea - Category associations
idea1.categories << cat1
idea1.categories << cat2
idea2.categories << cat2
idea2.categories << cat3
