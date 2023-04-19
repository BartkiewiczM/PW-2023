# db/seeds.rb

# Users
user1 = User.find_or_create_by(email: 'user1@example.com', full_name: 'User One', avatar_url: 'https://example.com/avatar1', provider: 'github', uid: '123456')



# Other users
user2 = User.find_or_create_by(email: 'user2@example.com', full_name: 'User Two', avatar_url: 'https://example.com/avatar2', provider: 'github', uid: '234567')

# Categories
cat1 = Category.find_or_create_by(name: 'Category 1')
cat2 = Category.find_or_create_by(name: 'Category 2')
cat3 = Category.find_or_create_by(name: 'Category 3')

# Projects
project1 = Project.find_or_create_by(name: 'Project 1', author: user1)
project2 = Project.find_or_create_by(name: 'Project 2', author: user2)
project3 = Project.find_or_create_by(name: 'Project 3', author: User.where(email: "mateuszbartkiewicz99@gmail.com").first)

# Goals
goal1 = Goal.find_or_create_by(name: 'Goal 1', notes: 'Some notes for Goal 1', project: project1)
goal2 = Goal.find_or_create_by(name: 'Goal 2', notes: 'Some notes for Goal 2', project: project1)
goal3 = Goal.find_or_create_by(name: 'Goal 3', notes: 'Some notes for Goal 3', project: project3)
goal4 = Goal.find_or_create_by(name: 'Goal 4', notes: 'Some notes for Goal 4', project: project3)

# Outcomes
outcome1 = Outcome.find_or_create_by(notes: 'Notes for Outcome 1', name: 'Outcome 1', goal: goal1, project: project1)
outcome2 = Outcome.find_or_create_by(notes: 'Notes for Outcome 2', name: 'Outcome 2', goal: goal2, project: project1)
outcome3 = Outcome.find_or_create_by(notes: 'Notes for Outcome 3', name: 'Outcome 3', goal: goal3, project: project3)
outcome4 = Outcome.find_or_create_by(notes: 'Notes for Outcome 4', name: 'Outcome 4', goal: goal4, project: project3)

# Opportunities
opp1 = Opportunity.find_or_create_by(name: 'Opportunity 1', source: 0, link: 'https://example.com/opp1', outcome: outcome1, project: project1)
opp2 = Opportunity.find_or_create_by(name: 'Opportunity 2', source: 1, link: 'https://example.com/opp2', outcome: outcome2, project: project1)
opp3 = Opportunity.find_or_create_by(name: 'Opportunity 3', source: 2, link: 'https://example.com/opp3', outcome: outcome3, project: project3)
opp4 = Opportunity.find_or_create_by(name: 'Opportunity 4', source: 3, link: 'https://example.com/opp4', outcome: outcome4, project: project3)
opp5 = Opportunity.find_or_create_by(name: 'Opportunity 5', source: 0, link: 'https://example.com/opp5', outcome: outcome4, project: project3)


# Ideas
idea1 = Idea.find_or_create_by(name: 'Idea 1', description: 'Description for Idea 1', comment: 'Comment for Idea 1', attachment: 'attachment1.jpg', status: 0, link: 'https://example.com/idea1', opportunity: opp1, project: project1)
idea2 = Idea.find_or_create_by(name: 'Idea 2', description: 'Description for Idea 2', comment: 'Comment for Idea 2', attachment: 'attachment2.jpg', status: 1, link: 'https://example.com/idea2', opportunity: opp2, project: project1)
idea3 = Idea.find_or_create_by(name: 'Idea 3', description: 'Description for Idea 3', comment: 'Comment for Idea 3', attachment: 'attachment3.jpg', status: 2, link: 'https://example.com/idea3', opportunity: opp3, project: project3)
idea4 = Idea.find_or_create_by(name: 'Idea 4', description: 'Description for Idea 4', comment: 'Comment for Idea 4', attachment: 'attachment4.jpg', status: 3, link: 'https://example.com/idea4', opportunity: opp4, project: project3)
idea5 = Idea.find_or_create_by(name: 'Idea 5', description: 'Description for Idea 5', comment: 'Comment for Idea 5', attachment: 'attachment5.jpg', status: 0, link: 'https://example.com/idea5', opportunity: opp5, project: project3)

# Experiments
experiment1 = Experiment.find_or_create_by(name: 'Experiment 1', idea: idea1, description: 'Description for Experiment 1', assumption: 'Assumption 1', validation_technique: 0, metric: 'Metric 1', success_metric: 'Success Metric 1', outcome: 'Outcome for Experiment 1', conclusion: 'Conclusion for Experiment 1', text_steps: 'Text steps for Experiment 1')
experiment2 = Experiment.find_or_create_by(name: 'Experiment 2', idea: idea2, description: 'Description for Experiment 2', assumption: 'Assumption 2', validation_technique: 1, metric: 'Metric 2', success_metric: 'Success Metric 2', outcome: 'Outcome for Experiment 2', conclusion: 'Conclusion for Experiment 2', text_steps: 'Text steps for Experiment 2')

# Idea - Category associations
idea1.categories << cat1
idea1.categories << cat2
idea2.categories << cat2
idea2.categories << cat3
