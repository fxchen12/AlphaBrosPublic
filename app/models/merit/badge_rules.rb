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
    include GoalsHelper
    include WorkoutsHelper
    include SessionsHelper

    def initialize
      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      grant_on 'users#create', :badge => 'registered', :to => :itself

      grant_on 'workout_records#create', :badge => 'workout', :to => :user

      grant_on 'workout_records#create', :badge => 'workout-10', :to => :user do |workout_record|
        workout_record.user.workout_records.count >= 10
      end

      grant_on 'workout_records#create', :badge => 'workout-25', :to => :user do |workout_record|
        workout_record.user.workout_records.count >= 25
      end

      grant_on 'workout_records#create', :badge => 'workout-50', :to => :user do |workout_record|
        workout_record.user.workout_records.count >= 50
      end

      grant_on 'workout_records#create', :badge => 'hours-10', :to => :user do |workout_record|
        total = 0
        workout_record.user.workout_records.each do |r|
          if r.duration != nil
            total += (r.duration / 60.0)
          end
        end
        total >= 10
      end

      grant_on 'workout_records#create', :badge => 'hours-100', :to => :user do |workout_record|
        total = 0
        workout_record.user.workout_records.each do |r|
          if r.duration != nil
            total += (r.duration / 60.0)
          end
        end
        total >= 100
      end

      grant_on 'workout_records#create', :badge => 'hours-1000', :to => :user do |workout_record|
        total = 0
        workout_record.user.workout_records.each do |r|
          if r.duration != nil
            total += (r.duration / 60.0)
          end
        end
        total >= 1000
      end

      grant_on 'workout_records#create', :badge => 'miles-10', :to => :user do |workout_record|
        total = 0
        workout_record.user.workout_records.each do |r|
          if r.distance != nil
            total += (r.distance)
          end
        end
        total >= 10
      end

      grant_on 'workout_records#create', :badge => 'miles-100', :to => :user do |workout_record|
        total = 0
        workout_record.user.workout_records.each do |r|
          if r.distance != nil
            total += (r.distance)
          end
        end
        total >= 100
      end

      grant_on 'workout_records#create', :badge => 'miles-1000', :to => :user do |workout_record|
        total = 0
        workout_record.user.workout_records.each do |r|
          if r.distance != nil
            total += (r.distance)
          end
        end
        total >= 1000
      end

      grant_on 'workout_record#create', :badge => 'daily-goal', :to => :user do |workout_record|
        total = 0
        workout_record.workout.goals.each do |g|
          if g.time_range == "day"
            if get_current_progress(g) >= 100
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
            if get_current_progress(g) >= 100
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
            if get_current_progress(g) >= 100
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
            if get_current_progress(g) >= 100
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
            if get_current_progress(g) >= 100
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
            if get_current_progress(g) >= 100
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
            if get_current_progress(g) >= 100
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
            if get_current_progress(g) >= 100
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
            if get_current_progress(g) >= 100
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
            if get_current_progress(g) >= 100
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
            if get_current_progress(g) >= 100
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
            if get_current_progress(g) >= 100
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
            if get_current_progress(g) >= 100
              total += 1
            end
          end
        end
        total >= 1
      end

      grant_on 'workout_record#create', :badge => 'weekly-hours-3', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :duration, "week")[0]
        total >= 3
      end

      grant_on 'workout_record#create', :badge => 'weekly-hours-5', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :duration, "week")[0]
        total >= 5
      end

      grant_on 'workout_record#create', :badge => 'weekly-hours-7', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :duration, "week")[0]
        total >= 7
      end

      grant_on 'workout_record#create', :badge => 'monthly-hours-15', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :duration, "month")[0]
        total >= 15
      end

      grant_on 'workout_record#create', :badge => 'monthly-hours-25', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :duration, "month")[0]
        total >= 25
      end

      grant_on 'workout_record#create', :badge => 'monthly-hours-35', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :duration, "month")[0]
        total >= 35
      end

      grant_on 'workout_record#create', :badge => 'yearly-hours-180', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :duration, "year")[0]
        total >= 180
      end

      grant_on 'workout_record#create', :badge => 'yearly-hours-300', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :duration, "year")[0]
        total >= 300
      end

      grant_on 'workout_record#create', :badge => 'yearly-hours-420', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :duration, "year")[0]
        total >= 420
      end

      grant_on 'workout_record#create', :badge => 'weekly-miles-10', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :distance, "week")[0]
        total >= 10
      end

      grant_on 'workout_record#create', :badge => 'weekly-miles-15', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :distance, "week")[0]
        total >= 15
      end

      grant_on 'workout_record#create', :badge => 'weekly-miles-20', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :distance, "week")[0]
        total >= 20
      end

      grant_on 'workout_record#create', :badge => 'monthly-miles-50', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :distance, "month")[0]
        total >= 50
      end

      grant_on 'workout_record#create', :badge => 'monthly-miles-75', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :distance, "month")[0]
        total >= 75
      end

      grant_on 'workout_record#create', :badge => 'monthly-miles-100', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :distance, "month")[0]
        total >= 100
      end

      grant_on 'workout_record#create', :badge => 'yearly-miles-600', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :distance, "year")[0]
        total >= 600
      end

      grant_on 'workout_record#create', :badge => 'yearly-miles-900', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :distance, "year")[0]
        total >= 900
      end

      grant_on 'workout_record#create', :badge => 'yearly-miles-1200', :to => :user do |workout_record|
        total = history_by_time_period(workout_record.workout, 1, :distance, "year")[0]
        total >= 1200
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
