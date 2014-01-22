# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+:votes => 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      grant_on 'users#create', :badge => 'registered', :to => :itself

      grant_on 'workout_record#create', :badge => 'workout', :to => :user

      grant_on 'workout_record#create', :badge => 'workout-10', :to => :user do |workout_record|
        workout_record.user.workout_records.count >= 10
      end

      grant_on 'workout_record#create', :badge => 'workout-25', :to => :user do |workout_record|
        workout_record.user.workouts_records.count >= 25
      end

      grant_on 'workout_record#create', :badge => 'workout-50', :to => :user do |workout_record|
        workout_record.user.workouts_records.count >= 50
      end

      grant_on 'workout_record#create', :badge => 'hours-10', :to => :user do |workout_record|
        total = 0
        workout_record.user.workout_records.each do |r|
          total += (r.duration / 60.0)
        end
        total >= 10
      end

      grant_on 'workout_record#create', :badge => 'hours-100', :to => :user do |workout_record|
        total = 0
        workout_record.user.workout_records.each do |r|
          total += (r.duration / 60.0)
        end
        total >= 100
      end
      
      grant_on 'workout_record#create', :badge => 'hours-1000', :to => :user do |workout_record|
        total = 0
        workout_record.user.workout_records.each do |r|
          total += (r.duration / 60.0)
        end
        total >= 1000
      end

      grant_on 'workout_record#create', :badge => 'miles-10', :to => :user do |workout_record|
        total = 0
        workout_record.user.workout_records.each do |r|
          total += (r.distance)
        end
        total >= 10
      end

      grant_on 'workout_record#create', :badge => 'miles-100', :to => :user do |workout_record|
        total = 0
        workout_record.user.workout_records.each do |r|
          total += (r.distance)
        end
        total >= 100
      end

      grant_on 'workout_record#create', :badge => 'miles-1000', :to => :user do |workout_record|
        total = 0
        workout_record.user.workout_records.each do |r|
          total += (r.distance)
        end
        total >= 1000
      end

      grant_on 'workout_record#create', :badge => 'daily-goal', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "day"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 1
      end

      grant_on 'workout_record#create', :badge => 'daily-goal-10', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "day"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 10
      end

      grant_on 'workout_record#create', :badge => 'daily-goal-25', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "day"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 25
      end

      grant_on 'workout_record#create', :badge => 'daily-goal-50', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "day"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 50
      end

      grant_on 'workout_record#create', :badge => 'weekly-goal', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "week"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 1
      end

      grant_on 'workout_record#create', :badge => 'weekly-goal-3', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "week"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 3
      end

      grant_on 'workout_record#create', :badge => 'weekly-goal-10', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "week"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 10
      end

      grant_on 'workout_record#create', :badge => 'weekly-goal-25', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "week"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 25
      end

      grant_on 'workout_record#create', :badge => 'monthly-goal', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "month"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 1
      end

      grant_on 'workout_record#create', :badge => 'monthly-goal-3', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "month"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 3
      end

      grant_on 'workout_record#create', :badge => 'monthly-goal-6', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "month"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 6
      end

      grant_on 'workout_record#create', :badge => 'monthly-goal-12', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "month"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 12
      end

      grant_on 'workout_record#create', :badge => 'yearly-goal', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "year"
            if get_current_progress(workout_record.workout, g) >= 100
              total += 1
            end
          end
        end
        total >= 1
      end


      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', :badge => 'commenter', :level => 10 do |comment|
      #   comment.user.comments.count == 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', :badge => 'relevant-commenter', :to => :user do |comment|
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', :badge => 'autobiographer', :temporary => true, :model_name => 'User' do |user|
      #   user.name.length > 4
      # end
    end
  end
end
