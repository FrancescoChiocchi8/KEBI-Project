% Facts related to guest types and associated meals
meal(carnivorous, formaggi_misti).
meal(vegetarian, formaggi_misti).
meal(carnivorous, trofie_cacio_e_pepe).
meal(vegetarian, trofie_cacio_e_pepe).
meal(carnivorous, spaghetti_aglio_olio_e_peperoncino).
meal(vegetarian, spaghetti_aglio_olio_e_peperoncino).
meal(carnivorous, patatine_fritte).
meal(vegetarian, patatine_fritte).
meal(carnivorous, pizza_margherita).
meal(vegetarian, pizza_margherita).
meal(carnivorous, pizza_bianca).
meal(vegetarian, pizza_bianca).
meal(carnivorous, water).
meal(vegetarian, water).
meal(carnivorous, coca-cola).
meal(vegetarian, coca-cola).
meal(carnivorous, affettati_misti).
meal(carnivorous, rigatoni_alla_carbonara).
meal(carnivorous, tagliatelle_alla_marinara).
meal(carnivorous, lasagne).
meal(carnivorous, grigliata_di_maiale_mista).
meal(carnivorous, bistecca_alla_fiorentina).
meal(carnivorous, pesce_arrosto).
meal(vegetarian, involtini_primavera).
meal(vegetarian, melanzane_grigliate).
meal(vegetarian, insalata_mista).
meal(vegetarian, fruit_salad).

% Rule to get the meal based on the guest type
category_meals(GuestType, Meal) :- meal(GuestType, Meal).


% Facts related to calories and associated meals
filtered_by_calories(Level, involtini_primavera) :- between(0, 3, Level).
filtered_by_calories(Level, affettati_misti) :- between(0, 2, Level).
filtered_by_calories(Level, formaggi_misti) :- between(0, 1, Level).
filtered_by_calories(Level, tagliatelle_alla_marinara) :- between(0, 2, Level).
filtered_by_calories(Level, rigatoni_alla_carbonara) :- between(0, 1, Level).
filtered_by_calories(Level, trofie_cacio_e_pepe) :- between(0, 2, Level).
filtered_by_calories(Level, spaghetti_aglio_olio_e_peperoncino) :- between(0, 3, Level).
filtered_by_calories(Level, lasagne) :- between(0, 1, Level).
filtered_by_calories(Level, grigliata_di_maiale_mista) :- between(0, 1, Level).
filtered_by_calories(Level, bistecca_alla_fiorentina) :- between(0, 2, Level).
filtered_by_calories(Level, pesce_arrosto) :- between(0, 3, Level).
filtered_by_calories(Level, patatine_fritte) :- Level = 0.
filtered_by_calories(Level, melanzane_grigliate) :- between(0, 3, Level).
filtered_by_calories(Level, insalata_mista) :- between(0, 3, Level).
filtered_by_calories(Level, pizza_margherita) :- between(0, 1, Level).
filtered_by_calories(Level, pizza_bianca) :- between(0, 2, Level).
filtered_by_calories(Level, water) :- between(0, 3, Level).
filtered_by_calories(Level, coca-cola) :- between(0, 1, Level).
filtered_by_calories(Level, fruit_salad) :- between(0, 2, Level).

% Rule to get meals filtered based on your level of calorie awareness
calories_match(Level, Meal) :- filtered_by_calories(Level, Meal).



% Meal facts filtered by allergy type
filtered_by_allergies(lactose, affettati_misti).
filtered_by_allergies(gluten, affettati_misti).
filtered_by_allergies(lactose_and_gluten, affettati_misti).
filtered_by_allergies(gluten, formaggi_misti).
filtered_by_allergies(lactose, tagliatelle_alla_marinara).
filtered_by_allergies(lactose, spaghetti_aglio_olio_e_peperoncino).
filtered_by_allergies(lactose, grigliata_di_maiale_mista).
filtered_by_allergies(gluten, grigliata_di_maiale_mista).
filtered_by_allergies(lactose_and_gluten, grigliata_di_maiale_mista).
filtered_by_allergies(lactose, bistecca_alla_fiorentina).
filtered_by_allergies(gluten, bistecca_alla_fiorentina).
filtered_by_allergies(lactose_and_gluten, bistecca_alla_fiorentina).
filtered_by_allergies(lactose, pesce_arrosto).
filtered_by_allergies(gluten, pesce_arrosto).
filtered_by_allergies(lactose_and_gluten, pesce_arrosto).
filtered_by_allergies(lactose, patatine_fritte).
filtered_by_allergies(gluten, patatine_fritte).
filtered_by_allergies(lactose_and_gluten, patatine_fritte).
filtered_by_allergies(lactose, melanzane_grigliate).
filtered_by_allergies(gluten, melanzane_grigliate).
filtered_by_allergies(lactose_and_gluten, melanzane_grigliate).
filtered_by_allergies(lactose, insalata_mista).
filtered_by_allergies(gluten, insalata_mista).
filtered_by_allergies(lactose_and_gluten, insalata_mista).
filtered_by_allergies(lactose, pizza_bianca).
filtered_by_allergies(lactose, water).
filtered_by_allergies(gluten, water).
filtered_by_allergies(lactose_and_gluten, water).
filtered_by_allergies(lactose, coca-cola).
filtered_by_allergies(gluten, coca-cola).
filtered_by_allergies(lactose_and_gluten, coca-cola).
filtered_by_allergies(lactose, fruit_salad).
filtered_by_allergies(gluten, fruit_salad).
filtered_by_allergies(lactose_and_gluten, fruit_salad).

% Rule to get filtered meals based on allergy type
allergies_match(Allergy_Type, Meal) :- filtered_by_allergies(Allergy_Type, Meal).


% Meal facts releted to courses
filtered_by_courses(appetizer, involtini_primavera).
filtered_by_courses(appetizer, affettati_misti).
filtered_by_courses(appetizer, formaggi_misti).
filtered_by_courses(first_meal, spaghetti_aglio_olio_e_peperoncino).
filtered_by_courses(first_meal, tagliatelle_alla_marinara).
filtered_by_courses(first_meal, lasagne).
filtered_by_courses(first_meal, rigatoni_alla_carbonara).
filtered_by_courses(first_meal, trofie_cacio_e_pepe).
filtered_by_courses(second_meal, grigliata_di_maiale_mista).
filtered_by_courses(second_meal, bistecca_alla_fiorentina).
filtered_by_courses(second_meal, pesce_arrosto).
filtered_by_courses(sidedish, patatine_fritte).
filtered_by_courses(sidedish, insalata_mista).
filtered_by_courses(sidedish, melanzane_grigliate).
filtered_by_courses(pizza, pizza_margherita).
filtered_by_courses(pizza, pizza_bianca).
filtered_by_courses(dessert, fruit_salad).
filtered_by_courses(drink, water).
filtered_by_courses(drink, coca_cola).

% Rule to get filtered meals based on courses
courses_match(Course_Type, Meal) :- filtered_by_courses(Course_Type, Meal).


% Rule to determine guest preferences based on category, calories, allergies, and courses
guest_preferences(none, CalorieLevel, none, none, GuestPreferences) :-
    once(findall(Meal, (calories_match(CalorieLevel, Meal)), GuestPreferences)).

guest_preferences(none, CalorieLevel, none, Course_Type, GuestPreferences) :-
    once(findall(Meal, (calories_match(CalorieLevel, Meal), courses_match(Course_Type, Meal)), GuestPreferences)).

guest_preferences(none, CalorieLevel, AllergyType, none, GuestPreferences) :-
    once(findall(Meal, (calories_match(CalorieLevel, Meal), allergies_match(AllergyType, Meal)), GuestPreferences)).

guest_preferences(none, CalorieLevel, AllergyType, Course_Type, GuestPreferences) :-
    once(findall(Meal, (calories_match(CalorieLevel, Meal), allergies_match(AllergyType, Meal), courses_match(Course_Type, Meal)), GuestPreferences)).

guest_preferences(GuestType, CalorieLevel, none, none, GuestPreferences) :-
    once(findall(Meal, (category_meals(GuestType, Meal), calories_match(CalorieLevel, Meal)), GuestPreferences)).

guest_preferences(GuestType, CalorieLevel, none, Course_Type, GuestPreferences) :-
    once(findall(Meal, (category_meals(GuestType, Meal), calories_match(CalorieLevel, Meal), courses_match(Course_Type, Meal)), GuestPreferences)).

guest_preferences(GuestType, CalorieLevel, Allergy_Type, none, GuestPreferences) :-
    once(findall(Meal, (category_meals(GuestType, Meal), calories_match(CalorieLevel, Meal), allergies_match(Allergy_Type, Meal)), GuestPreferences)).

guest_preferences(GuestType, CalorieLevel, AllergyType, Course_Type, GuestPreferences) :-
    once(findall(Meal, (category_meals(GuestType, Meal), calories_match(CalorieLevel, Meal), allergies_match(AllergyType, Meal), courses_match(Course_Type, Meal)), GuestPreferences)).


% Ingredients in a Meal
ingredient(involtini_primavera, [salt, oil, carrot, cabbage, puff_pastry]).
ingredient(affettati_misti, [salt, ciauscolo, salame, ham, black_pepper]).
ingredient(formaggi_misti, [salt, cow_cheese, sheep_cheese, parmesan]).
ingredient(tagliatelle_alla_marinara, [salt, oil, pasta, shrimp, mussel]).
ingredient(rigatoni_alla_carbonara, [salt, oil, pasta, sheep_cheese, egg, black_pepper, pork_cheek]).
ingredient(trofie_cacio_e_pepe, [salt, oil, pasta, black_pepper]).
ingredient(spaghetti_aglio_olio_e_peperoncino, [salt, oil, pasta, garlic, chili]).
ingredient(lasagne, [salt, oil, carrot, pasta, parmesan, tomato, bechamel, minced_meat]).
ingredient(grigliata_di_maiale_mista, [salt, pork_rib, sausage, pork_chop]).
ingredient(bistecca_alla_fiorentina, [salt, oil, steak]).
ingredient(pesce_arrosto, [salt, oil, shrimp, mussel, calamari, sword_fish, salmon]).
ingredient(patatine_fritte, [salt, oil, potato]).
ingredient(melanzane_grigliate, [salt, oil, eggplant]).
ingredient(pizza_margherita, [salt, oil, cow_cheese, tomato, water, type_0_flour]).
ingredient(pizza_bianca, [salt, oil, water, type_0_flour]).
ingredient(coca_cola, [water, sugar_and_food_coloring]).
ingredient(insalata_mista, [salt, oil, lettuce, corn]).
ingredient(fruit_salad, [apple, banana, strawberry]).


% Rule to find the ingredients of a dish
dish_ingredients(Meal, Ingredients) :-
    findall(Ingredient, ingredient(Meal, Ingredient), Ingredients).

% Calories for single ingredient
kcal_in_ingredient(oil, 60).
kcal_in_ingredient(eggplant, 18).
kcal_in_ingredient(cows_cheese, 115).
kcal_in_ingredient(sheeps_cheese, 135).
kcal_in_ingredient(pasta, 300).
kcal_in_ingredient(shrimp, 35).
kcal_in_ingredient(ciauscolo, 70).
kcal_in_ingredient(salame, 50).
kcal_in_ingredient(ham, 45).
kcal_in_ingredient(carrot, 27).
kcal_in_ingredient(cabbage, 25).
kcal_in_ingredient(puff_pastry, 150).
kcal_in_ingredient(mussel, 40).
kcal_in_ingredient(salt, 0).
kcal_in_ingredient(type_0_flour, 500).
kcal_in_ingredient(water, 0).
kcal_in_ingredient(parmesan, 75).
kcal_in_ingredient(egg, 80).
kcal_in_ingredient(black_pepper, 25).
kcal_in_ingredient(pork_cheek, 150).
kcal_in_ingredient(garlic, 3).
kcal_in_ingredient(chili, 15).
kcal_in_ingredient(tomato, 30).
kcal_in_ingredient(bechamel, 105).
kcal_in_ingredient(mozzarella_cheese, 150).
kcal_in_ingredient(minced_meat, 120).
kcal_in_ingredient(pork_rib, 70).
kcal_in_ingredient(sausage, 205).
kcal_in_ingredient(pork_chop, 125).
kcal_in_ingredient(steak, 485).
kcal_in_ingredient(calamari, 50).
kcal_in_ingredient(sword_fish, 120).
kcal_in_ingredient(salmon, 150).
kcal_in_ingredient(potato, 450).
kcal_in_ingredient(lettuce, 25).
kcal_in_ingredient(mais, 50).
kcal_in_ingredient(sugar_and_food_coloring, 204).
kcal_in_ingredient(apple, 35).
kcal_in_ingredient(banana, 40).
kcal_in_ingredient(strawberry, 22).
kcal_in_ingredient(_, 0).  % Default value for any undefined ingredient

% Rule to obtain the calories of a single ingredient
ingredient_kcal(Ingredient, Kcal) :-
    once(kcal_in_ingredient(Ingredient, Kcal)).

% Calculation of the total calories of a meal given a list of ingredients
kcal_in_meal([], 0).
kcal_in_meal([Ingredient | Rest], TotalKcal) :-
    kcal_in_ingredient(Ingredient, Kcal),
    kcal_in_meal(Rest, RestKcal),
    TotalKcal is Kcal + RestKcal.

% Calculation of the total calories of a meal given the name of the meal
meal_total_kcal(Meal, TotalKcal) :-
    once(ingredient(Meal, Ingredients)),
    once(kcal_in_meal(Ingredients, TotalKcal)).

% Rule to obtain both the ingredients and the total calories of a dish
meal_info(Meal, Ingredients, TotalKcal) :-
    once(ingredient(Meal, Ingredients)),
    once(kcal_in_meal(Ingredients, TotalKcal)).


% QUERY example:

% guest_preferences(carnivorous, 2, lactose, none, GuestPreferences).

% guest_preferences(none, 0, none, none, GuestPreferences).

% guest_preferences(none, 0, lactose, appetizer, GuestPreferences).

% ingredient_kcal(carrot, Kcal).

% meal_info(lasagne, Ingredients, TotalKcal).
