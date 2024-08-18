% Define the list of ingredients used in meals
ingredient(salt).
ingredient(oil).
ingredient(carrot).
ingredient(cabbage).
ingredient(puff_pastry).
ingredient(ciauscolo).
ingredient(salame).
ingredient(ham).
ingredient(black_pepper).
ingredient(cow_cheese).
ingredient(sheep_cheese).
ingredient(parmesan).
ingredient(mozzarella_cheese).
ingredient(pasta).
ingredient(egg).
ingredient(pork_cheek).
ingredient(shrimp).
ingredient(mussel).
ingredient(chili).
ingredient(garlic).
ingredient(tomato).
ingredient(bechamel).
ingredient(minced_meat).
ingredient(pork_chop).
ingredient(pork_rib).
ingredient(sausage).
ingredient(steak).
ingredient(calamari).
ingredient(sword_fish).
ingredient(salmon).
ingredient(potato).
ingredient(eggplant).
ingredient(type_0_flour).
ingredient(water).
ingredient(sugar_and_food_coloring).
ingredient(corn).
ingredient(lettuce).
ingredient(apple).
ingredient(banana).
ingredient(strawberry).

% Define the caloric content of each ingredient
kcal_ingredient(salt, 0).
kcal_ingredient(oil, 60).
kcal_ingredient(carrot, 27).
kcal_ingredient(cabbage, 25).
kcal_ingredient(puff_pastry, 150).
kcal_ingredient(ciauscolo, 70).
kcal_ingredient(salame, 50).
kcal_ingredient(ham, 45).
kcal_ingredient(black_pepper, 25).
kcal_ingredient(cow_cheese, 120).
kcal_ingredient(sheep_cheese, 135).
kcal_ingredient(parmesan, 85).
kcal_ingredient(mozzarella_cheese, 120).
kcal_ingredient(pasta, 300).
kcal_ingredient(egg, 80).
kcal_ingredient(pork_cheek, 150).
kcal_ingredient(shrimp, 35).
kcal_ingredient(mussel, 40).
kcal_ingredient(chili, 15).
kcal_ingredient(garlic, 3).
kcal_ingredient(tomato, 30).
kcal_ingredient(bechamel, 105).
kcal_ingredient(minced_meat, 120).
kcal_ingredient(pork_chop, 125).
kcal_ingredient(pork_rib, 70).
kcal_ingredient(sausage, 205).
kcal_ingredient(steak, 485).
kcal_ingredient(calamari, 50).
kcal_ingredient(sword_fish, 120).
kcal_ingredient(salmon, 150).
kcal_ingredient(potato, 450).
kcal_ingredient(eggplant, 18).
kcal_ingredient(type_0_flour, 500).
kcal_ingredient(water, 0).
kcal_ingredient(sugar_and_food_coloring, 465).
kcal_ingredient(corn, 50).
kcal_ingredient(lettuce, 25).
kcal_ingredient(apple, 35).
kcal_ingredient(banana, 40).
kcal_ingredient(strawberry, 22).

% Define which ingredients are carnivorous
ingredient_carnivore(ciauscolo).
ingredient_carnivore(salame).
ingredient_carnivore(ham).
ingredient_carnivore(pork_cheek).
ingredient_carnivore(minced_meat).
ingredient_carnivore(pork_rib).
ingredient_carnivore(sausage).
ingredient_carnivore(shrimp).
ingredient_carnivore(mussel).
ingredient_carnivore(steak).
ingredient_carnivore(calamari).
ingredient_carnivore(sword_fish).
ingredient_carnivore(salmon).

% Define which ingredients are vegetarian
ingredient_vegetarian(carrot).
ingredient_vegetarian(cabbage).
ingredient_vegetarian(eggplant).
ingredient_vegetarian(lettuce).
ingredient_vegetarian(apple).
ingredient_vegetarian(banana).
ingredient_vegetarian(strawberry).

% Define which ingredients cause lactose intolerance
ingredient_with_lactose_intolerance(cow_cheese).
ingredient_with_lactose_intolerance(sheep_cheese).
ingredient_with_lactose_intolerance(parmesan).
ingredient_with_lactose_intolerance(mozzarella_cheese).
ingredient_with_lactose_intolerance(bechamel).

% Define which ingredients contain gluten
ingredient_with_gluten_intolerance(type_0_flour).
ingredient_with_gluten_intolerance(pasta).
ingredient_with_gluten_intolerance(puff_pastry).

% Define various meals along with their courses and ingredients
meal(involtini_primavera, appetizer, [salt, oil, carrot, cabbage, puff_pastry]).
meal(affettati_misti, appetizer, [salt, ciauscolo, salame, ham, black_pepper]).
meal(formaggi_misti, appetizer, [salt, cow_cheese, sheep_cheese, parmesan]).
meal(tagliatelle_alla_marinara, first_dish, [salt, oil, pasta, shrimp, mussel]).
meal(rigatoni_alla_carbonara, first_dish, [salt, oil, pasta, sheep_cheese, egg, black_pepper, pork_cheek]).
meal(trofie_cacio_e_pepe, first_dish, [salt, oil, pasta, black_pepper, sheep_cheese]).
meal(spaghetti_aglio_olio_e_peperoncino, first_dish, [salt, oil, pasta, garlic, chili]).
meal(lasagne, first_dish, [salt, oil, carrot, pasta, parmesan, tomato, bechamel, minced_meat]).
meal(grigliata_di_maiale_mista, second_course, [salt, pork_rib, sausage, pork_chop]).
meal(bistecca_alla_fiorentina, second_course, [salt, oil, steak]).
meal(pesce_arrosto, second_course, [salt, oil, shrimp, mussel, calamari, sword_fish, salmon]).
meal(verdure_miste, second_course, [salt, cabbage, eggplant, lettuce]).
meal(patatine_fritte, sidedish, [salt, oil, potato]).
meal(melanzane_grigliate, sidedish, [salt, oil, eggplant]).
meal(insalata_mista, sidedish, [salt, oil, lettuce, corn]).
meal(pizza_margherita, main_dish, [salt, oil, cow_cheese, tomato, water, type_0_flour]).
meal(pizza_bianca, main_dish, [salt, oil, water, type_0_flour]).
meal(water, drink, [water]).
meal(coca_cola, drink, [water, sugar_and_food_coloring]).
meal(fruit_salad, dessert, [apple, banana, strawberry]).

% Determine if a meal is vegetarian
vegetarian_meal(Meal, Course) :-
    meal(Meal, Course, Ingredients),
    forall(member(Ingredient, Ingredients),
           (ingredient_vegetarian(Ingredient); \+ ingredient_carnivore(Ingredient))).

% Determine if a meal is carnivorous
carnivorous_meal(Meal, Course) :-
    meal(Meal, Course, Ingredients),
    % Ensure all ingredients are either carnivorous or not vegetarian
    forall(member(Ingredient, Ingredients),
           (ingredient_carnivore(Ingredient); \+ ingredient_vegetarian(Ingredient))).

% Define meals that contain both carnivorous and vegetarian ingredients
omnivore_meal(Meal, Course) :-
    meal(Meal, Course, Ingredients),
    forall(member(Ingredient, Ingredients), ingredient(Ingredient)).

% Find meals with gluten intolerance
meal_with_gluten_intolerance(Meal, Course) :-
    findall(Meal-Course,
            (meal(Meal, Course, Ingredients),
             member(Ingredient, Ingredients),
             ingredient_with_gluten_intolerance(Ingredient)),
            MealsWithGlutenIntolerance),
    list_to_set(MealsWithGlutenIntolerance, UniqueMeals),
    member(Meal-Course, UniqueMeals).

% Find meals with lactose intolerance
meal_with_lactose_intolerance(Meal, Course) :-
    findall(Meal-Course,
            (meal(Meal, Course, Ingredients),
             member(Ingredient, Ingredients),
             ingredient_with_lactose_intolerance(Ingredient)),
            MealsWithLactoseIntolerance),
    list_to_set(MealsWithLactoseIntolerance, UniqueMeals),
    member(Meal-Course, UniqueMeals).

% Calculate the total caloric content of a meal
meal_calories(Meal, Course, TotalCalories) :-
    meal(Meal, Course, Ingredients),
    findall(Calories, 
            (member(Ingredient, Ingredients), 
             kcal_ingredient(Ingredient, Kcal), 
             Calories is Kcal), 
            CaloriesList),
    sum_list(CaloriesList, TotalCalories).

% Determine calorie-conscious levels based on total calories
calorie_conscious_levels(Meal, Course, Levels) :-
    meal_calories(Meal, Course, TotalCalories),
    % Determine the highest applicable level based on total calories
    ( TotalCalories > 650 -> HighestLevel = 0
    ; TotalCalories =< 250 -> HighestLevel = 3
    ; TotalCalories =< 450 -> HighestLevel = 2
    ; TotalCalories =< 650 -> HighestLevel = 1
    ),
    % Generate all levels up to the highest applicable level
    findall(Level, (between(0, HighestLevel, Level)), Levels).

% Filter meals based on guest preferences, including category, calorie level, and allergies
guest_preferences(Category, CalorieLevel, Allergies, Meal, Course) :-
    % Filtered meals by Category (carnivorous, vegetarian, omnivore)
    ( Category = carnivorous -> carnivorous_meal(Meal, Course)
    ; Category = vegetarian -> vegetarian_meal(Meal, Course)
    ; Category = omnivore -> omnivore_meal(Meal, Course)
    ),
    % Filtered meals by calorie_consciou_level
    calorie_conscious_levels(Meal, Course, Levels),
    member(CalorieLevel, Levels),
    % Filtered meals by allergies
    ( Allergies = none -> true
    ; ( Allergies = lactose -> not(meal_with_lactose_intolerance(Meal, Course))
      ; Allergies = gluten -> not(meal_with_gluten_intolerance(Meal, Course))
    )
    ).

% QUERY EXAMPLES:

% guest_preferences(omnivore, 0, none, Meal, Course).

% guest_preferences(omnivore, 0, gluten, Meal, Course).

% guest_preferences(carnivorous, 2, none, Meal, Course).

% guest_preferences(carnivorous, 0, none, Meal, Course).

% guest_preferences(carnivorous, 0, lactose, Meal, Course).

% guest_preferences(vegetarian, 3, none, Meal, Course).

% guest_preferences(vegetarian, 1, none, Meal, Course).