# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongo_mapper and :mongoid
  # config.orm = :active_record

  # Define :user_model_name. This model will be used to grand badge if no :to option is given. Default is "User".
  # config.user_model_name = "User"

  # Define :current_user_method. Similar to previous option. It will be used to retrieve :user_model_name object if no :to option is given. Default is "current_#{user_model_name.downcase}".
  # config.current_user_method = "current_user"
end

Merit::Badge.create! ({
    id: 1,
    name: "registered",
    level: 1,
    description: "Started My Journey",
    custom_fields: { cat: :Firsts }
})

Merit::Badge.create! ({
    id: 2,
    name: "workout",
    level: 1,
    description: "Completed First Workout",
    custom_fields: { cat: :Firsts }
})

Merit::Badge.create! ({
    id: 3,
    name: "daily-goal",
    level: 1,
    description: "Completed a Daily Goal",
    custom_fields: { cat: :Firsts }
})

Merit::Badge.create! ({
    id: 4,
    name: "weekly-goal",
    level: 1,
    description: "Completed a Weekly Goal",
    custom_fields: { cat: :Firsts }
})

Merit::Badge.create! ({
    id: 5,
    name: "monthly-goal",
    level: 2,
    description: "Completed a Monthly Goal",
    custom_fields: { cat: :Firsts }
})

Merit::Badge.create! ({
    id: 6,
    name: "yearly-goal",
    level: 3,
    description: "Completed a Yearly Goal",
    custom_fields: { cat: :Firsts }
})

Merit::Badge.create! ({
    id: 7,
    name: "workout-10",
    level: 1,
    description: "Completed 10 Workouts",
    custom_fields: { cat: :Workouts }
})

Merit::Badge.create! ({
    id: 8,
    name: "workout-25",
    level: 2,
    description: "Completed 25 Workouts",
    custom_fields: { cat: :Workouts }
})

Merit::Badge.create! ({
    id: 9,
    name: "workout-50",
    level: 3,
    description: "Completed 50 Workouts",
    custom_fields: { cat: :Workouts }
})

Merit::Badge.create! ({
    id: 10,
    name: "daily-goal-10",
    level: 2,
    description: "Completed 10 Daily Goals",
    custom_fields: { cat: :Goals }
})

Merit::Badge.create! ({
    id: 11,
    name: "daily-goal-25",
    level: 2,
    description: "Completed 25 Daily Goals",
    custom_fields: { cat: :Goals }
})

Merit::Badge.create! ({
    id: 12,
    name: "daily-goal-50",
    level: 3,
    description: "Completed 50 Daily Goals",
    custom_fields: { cat: :Goals }
})

Merit::Badge.create! ({
    id: 13,
    name: "weekly-goal-3",
    level: 2,
    description: "Completed 3 Weekly Goals",
    custom_fields: { cat: :Goals }
})

Merit::Badge.create! ({
    id: 14,
    name: "weekly-goal-10",
    level: 2,
    description: "Completed 10 Weekly Goals",
    custom_fields: { cat: :Goals }
})

Merit::Badge.create! ({
    id: 15,
    name: "weekly-goal-25",
    level: 3,
    description: "Completed 25 Weekly Goals",
    custom_fields: { cat: :Goals }
})

Merit::Badge.create! ({
    id: 16,
    name: "monthly-goal-2",
    level: 2,
    description: "Completed 2 Monthly Goals",
    custom_fields: { cat: :Goals }
})

Merit::Badge.create! ({
    id: 17,
    name: "monthly-goal-6",
    level: 3,
    description: "Completed 6 Monthly Goals",
    custom_fields: { cat: :Goals }
})

Merit::Badge.create! ({
    id: 18,
    name: "monthly-goal-12",
    level: 3,
    description: "Completed 12 Monthly Goals",
    custom_fields: { cat: :Goals }
})

Merit::Badge.create! ({
    id: 19,
    name: "hours-10",
    level: 1,
    description: "10 Hours of Exercise",
    custom_fields: { cat: :Time }
})

Merit::Badge.create! ({
    id: 20,
    name: "hours-100",
    level: 2,
    description: "100 Hours of Exercise",
    custom_fields: { cat: :Time }

})

Merit::Badge.create! ({
    id: 21,
    name: "hours-1000",
    level: 3,
    description: "1000 Hours of Exercise",
    custom_fields: { cat: :Time }
})

Merit::Badge.create! ({
    id: 22,
    name: "weekly-hours-3",
    level: 1,
    description: "3 Hours in a Week",
    custom_fields: { cat: :Time }
})

Merit::Badge.create! ({
    id: 23,
    name: "weekly-hours-5",
    level: 2,
    description: "5 Hours in a Week",
    custom_fields: { cat: :Time }
})

Merit::Badge.create! ({
    id: 24,
    name: "weekly-hours-7",
    level: 3,
    description: "7 Hours in a Week",
    custom_fields: { cat: :Time }
})

Merit::Badge.create! ({
    id: 25,
    name: "monthly-hours-15",
    level: 1,
    description: "15 Hours in a Month",
    custom_fields: { cat: :Time }
})

Merit::Badge.create! ({
    id: 26,
    name: "monthly-hours-25",
    level: 2,
    description: "25 Hours in a Month",
    custom_fields: { cat: :Time }
})

Merit::Badge.create! ({
    id: 27,
    name: "monthly-hours-35",
    level: 3,
    description: "35 Hours in a Month",
    custom_fields: { cat: :Time }
})

Merit::Badge.create! ({
    id: 28,
    name: "yearly-hours-180",
    level: 2,
    description: "180 Hours in a Year",
    custom_fields: { cat: :Time }
})

Merit::Badge.create! ({
    id: 29,
    name: "yearly-hours-300",
    level: 3,
    description: "300 Hours in a Year",
    custom_fields: { cat: :Time }
})

Merit::Badge.create! ({
    id: 30,
    name: "yearly-hours-420",
    level: 3,
    description: "420 Hours in a Year",
    custom_fields: { cat: :Time }
})

Merit::Badge.create! ({
    id: 31,
    name: "miles-10",
    level: 1,
    description: "10 Miles Exercising",
    custom_fields: { cat: :Distance }
})

Merit::Badge.create! ({
    id: 32,
    name: "miles-100",
    level: 2,
    description: "100 Miles Exercising",
    custom_fields: { cat: :Distance }
})

Merit::Badge.create! ({
    id: 33,
    name: "miles-1000",
    level: 3,
    description: "1000 Miles Exercising",
    custom_fields: { cat: :Distance }
})

Merit::Badge.create! ({
    id: 34,
    name: "weekly-miles-10",
    level: 1,
    description: "10 Miles in a Week",
    custom_fields: { cat: :Distance }
})

Merit::Badge.create! ({
    id: 35,
    name: "weekly-miles-15",
    level: 2,
    description: "15 Miles in a Week",
    custom_fields: { cat: :Distance }
})

Merit::Badge.create! ({
    id: 36,
    name: "weekly-miles-20",
    level: 3,
    description: "20 Miles in a Week",
    custom_fields: { cat: :Distance }
})

Merit::Badge.create! ({
    id: 37,
    name: "monthly-miles-50",
    level: 2,
    description: "50 Miles in a Month",
    custom_fields: { cat: :Distance }
})

Merit::Badge.create! ({
    id: 38,
    name: "monthly-miles-75",
    level: 2,
    description: "75 Miles in a Month",
    custom_fields: { cat: :Distance }
})

Merit::Badge.create! ({
    id: 39,
    name: "monthly-miles-100",
    level: 3,
    description: "100 Miles in a Month",
    custom_fields: { cat: :Distance }
})

Merit::Badge.create! ({
    id: 40,
    name: "yearly-miles-600",
    level: 2,
    description: "600 Miles in a Year",
    custom_fields: { cat: :Distance }
})

Merit::Badge.create! ({
    id: 41,
    name: "yearly-miles-900",
    level: 3,
    description: "900 Miles in a Year",
    custom_fields: { cat: :Distance }
})

Merit::Badge.create! ({
    id: 42,
    name: "yearly-miles-1200",
    level: 3,
    description: "1200 Miles in a Year",
    custom_fields: { cat: :Distance }
})