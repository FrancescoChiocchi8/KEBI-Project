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



% Rule to determine guest preferences based on category, calories, and allergies
guest_preferences(none, CalorieLevel, none, GuestPreferences) :-
    once(findall(Meal, (calories_match(CalorieLevel, Meal)), GuestPreferences)).

guest_preferences(none, CalorieLevel, AllergyType, GuestPreferences) :-
    once(findall(Meal, (calories_match(CalorieLevel, Meal), allergies_match(AllergyType, Meal)), GuestPreferences)).

guest_preferences(GuestType, CalorieLevel, none, GuestPreferences) :-
    once(findall(Meal, (category_meals(GuestType, Meal), calories_match(CalorieLevel, Meal)), GuestPreferences)).

guest_preferences(GuestType, CalorieLevel, AllergyType, GuestPreferences) :-
    once(findall(Meal, (category_meals(GuestType, Meal), calories_match(CalorieLevel, Meal), allergies_match(AllergyType, Meal)), GuestPreferences)).


% Facts related to ingredients for each dish
ingredient(involtini_primavera, salt).
ingredient(affettati_misti, salt).
ingredient(formaggi_misti, salt).
ingredient(tagliatelle_alla_marinara, salt).
ingredient(rigatoni_alla_carbonara, salt).
ingredient(trofie_cacio_e_pepe, salt).
ingredient(spaghetti_aglio_olio_e_peperoncino, salt).
ingredient(lasagne, salt).
ingredient(grigliata_di_maiale_mista, salt).
ingredient(bistecca_alla_fiorentina, salt).
ingredient(pesce_arrosto, salt).
ingredient(patatine_fritte, salt).
ingredient(melanzane_grigliate, salt).
ingredient(insalata_mista, salt).
ingredient(pizza_margherita, salt).
ingredient(pizza_bianca, salt).

ingredient(involtini_primavera, oil).
ingredient(tagliatelle_alla_marinara, oil).
ingredient(rigatoni_alla_carbonara, oil).
ingredient(trofie_cacio_e_pepe, oil).
ingredient(spaghetti_aglio_olio_e_peperoncino, oil).
ingredient(lasagne, oil).
ingredient(bistecca_alla_fiorentina, oil).
ingredient(pesce_arrosto, oil).
ingredient(patatine_fritte, oil).
ingredient(melanzane_grigliate, oil).
ingredient(insalata_mista, oil).
ingredient(pizza_margherita, oil).
ingredient(pizza_bianca, oil).

ingredient(involtini_primavera, carrot).
ingredient(lasagne, carrot).

ingredient(involtini_primavera, cabbage).

ingredient(affettati_misti, ciauscolo).
ingredient(affettati_misti, salame).
ingredient(affettati_misti, ham).

ingredient(formaggi_misti, cow_cheese).
ingredient(pizza_margherita, cow_cheese).

ingredient(formaggi_misti, sheep_cheese).
ingredient(rigatoni_alla_carbonara, sheep_cheese).

ingredient(tagliatelle_alla_marinara, pasta).
ingredient(rigatoni_alla_carbonara, pasta).
ingredient(trofie_cacio_e_pepe, pasta).
ingredient(spaghetti_aglio_olio_e_peperoncino, pasta).
ingredient(lasagne, pasta).

ingredient(tagliatelle_alla_marinara, shrimp).
ingredient(pesce_arrosto, shrimp).

ingredient(involtini_primavera, puff_pastry).

ingredient(tagliatelle_alla_marinara, mussel).
ingredient(pesce_arrosto, mussel).

ingredient(formaggi_misti, parmesan).
ingredient(lasagne, parmesan).

ingredient(rigatoni_alla_carbonara, egg).

ingredient(affettati_misti, black_pepper).
ingredient(rigatoni_alla_carbonara, black_pepper).
ingredient(trofie_cacio_e_pepe, black_pepper).

ingredient(rigatoni_alla_carbonara, pork_cheek).

ingredient(spaghetti_aglio_olio_e_peperoncino, garlic).

ingredient(spaghetti_aglio_olio_e_peperoncino, chili).

ingredient(lasagne, tomato).
ingredient(pizza_margherita, tomato).

ingredient(lasagne, bechamel).

ingredient(lasagne, minced_meat).

ingredient(grigliata_di_maiale_mista, pork_rib).
ingredient(grigliata_di_maiale_mista, sausage).
ingredient(grigliata_di_maiale_mista, pork_chop).

ingredient(bistecca_alla_fiorentina, steak).

ingredient(pesce_arrosto, calamari).
ingredient(pesce_arrosto, sword_fish).
ingredient(pesce_arrosto, salmon).

ingredient(patatine_fritte, potato).

ingredient(melanzane_grigliate, eggplant).

ingredient(pizza_margherita, water).
ingredient(pizza_bianca, water).
ingredient(coca_cola, water).

ingredient(insalata_mista, lettuce).
ingredient(insalata_mista, corn).

ingredient(pizza_margherita, type_0_flour).
ingredient(pizza_bianca, type_0_flour).

ingredient(coca_cola, sugar_and_food_coloring).

ingredient(fruit_salad, apple).
ingredient(fruit_salad, banana).
ingredient(fruit_salad, strawberry).

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
    once(dish_ingredients(Meal, Ingredients)),
    once(kcal_in_meal(Ingredients, TotalKcal)).

% Rule to obtain both the ingredients and the total calories of a dish
meal_info(Meal, Ingredients, TotalKcal) :-
    once(dish_ingredients(Meal, Ingredients)),
    once(meal_total_kcal(Meal, TotalKcal)).


% QUERY example:

% guest_preferences(carnivorous, 2, lactose, GuestPreferences).

% guest_preferences(none, 0, none).

% guest_preferences(none, 0, lactose).

% guest_preferences(carnivorous, 0, none).

% ingredient_kcal(carrot, Kcal).

% meal_info(lasagne, Ingredients, TotalKcal).