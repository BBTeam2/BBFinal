//
//  AllRecipeVC.m
//  CookingAppDgn
//
//  Created by iOS on 1/4/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "AllRecipesVC.h"
#import "RecipeDisplayCell.h"
#import "Recipes.h"
#import "CurrentSelectedVC.h"
@interface AllRecipesVC ()

@end

@implementation AllRecipesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //make sure singleton is set up
    recipeSingleton = [AllRecipeSingleton objectManager];
    //load the array
    [self LoadRecipeArray];
    //setup the AllrecipeArray
    self.arrAllRecipe = recipeSingleton.AllMyRecipeTab;
    //set the singletonID to hold this tabs navigation controller;
    recipeSingleton.FirstTabNavController = self.navigationController;

    //load the tableview
    [self.allReceipeTableView reloadData];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    //make sure the array is accurate
    self.arrAllRecipe = recipeSingleton.AllMyRecipeTab;
    [self.allReceipeTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Loading Functions
//Load all of our recipes
-(void)LoadRecipeArray
{
    //hard coded functions to fill up array with data on start
    [self LoadRecipe1];
    [self LoadRecipe2];
    [self LoadRecipe3];
    [self LoadRecipe4];
    [self LoadRecipe5];
    [self LoadRecipe6];
    [self LoadRecipe7];
    [self LoadRecipe8];
    [self LoadRecipe9];
    [self LoadRecipe10];
    
}


#pragma mark TableView Functions
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecipeDisplayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AllRecipeCell"];
    
    cell.cellImageView.image = [self.arrAllRecipe[indexPath.row] uiImage];
    cell.titleLabel.text = [self.arrAllRecipe[indexPath.row] strTitle];
    cell.descripLabel.text = [self.arrAllRecipe[indexPath.row] strDescription];
    // the tag will be our identifier when a button is pressed (so we can segue
    // to the correct part of the array
    cell.ViewButton.tag = indexPath.row;
    [cell.ViewButton addTarget:self action:@selector(LetsPush:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrAllRecipe.count;
}

-(void)LetsPush:(UIButton*)sender
{
    //lets check if other tab is currently in the way
    UINavigationController *otherTabNav = recipeSingleton.ThirdTabNavController;
    if (otherTabNav != nil) {
        [otherTabNav popToRootViewControllerAnimated:YES];
    }
    
    [self performSegueWithIdentifier:@"Tab1ToCurrent" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //this is the specific Recipe we are passing to the next view
    
    if ([[segue identifier] isEqualToString:@"Tab1ToCurrent"]) {
        NSInteger index = [(UIButton*)sender tag];
        Recipes* CurrentRecipe = self.arrAllRecipe[index];
        CurrentSelectedVC *destinationVC =  segue.destinationViewController;
        destinationVC.currentRecipe = CurrentRecipe;
        //play some sweet sounds
        [recipeSingleton.cookingSound playSound];
    }

}


#pragma mark Hard Coded Load Recipe Functions
-(void)LoadRecipe1
{
    
    Recipes *CreateArrayRecipe = [[Recipes alloc]initDefaults];
    
    //Create Cooking Steps Array...
    NSArray *descriptionArray = @[@"Preheat grill",@"Rinse and add shrimp to grill. Marinate with olive oil and stir occasionally",@"Add tomatoes, black pepper. Simmer grill to mid-low temperature and stir"];
    //Create Timer Array...
    NSArray *timerArray = @[@10,@10,@5];
    
    //Pass arrays to helper function...
    NSMutableArray *recipeStepArray = [CreateArrayRecipe createCookingStepsArray:(NSMutableArray*)descriptionArray withTimerArray:timerArray];
    
    
    //Create Ingredients Array...
    NSArray *IngredientsArray = @[@"Pound of shrimp",@"Teaspoon of Olive Oil",@"Black Pepper",@"Pint of Tomatoes"];
    //Create IngredientAmountsArray...
    NSArray *IngredientAmountsArray = @[@1,@2,@1,@1];
    
    NSMutableArray *recipeIngredientsArray = [CreateArrayRecipe createIngredientsArray:(NSMutableArray*)IngredientsArray withAmountArray:(NSMutableArray*)IngredientAmountsArray];
    
    //Pass Ingredients and Cooking steps array to Master array of Recipies
    //using helper function initWithTitle...
    Recipes *myRecipe = [[ Recipes alloc]initWithTitle:(NSMutableString*)@"Grilled Shrimp Souvlaki" withDescription:(NSMutableString*)@"Greek dish combines seafood, veggies, and plenty of herbs" withImage:[UIImage imageNamed: @"Recipe1"] withCategory:(NSMutableString*)@"Tropical" withSteps:recipeStepArray withIngredients:recipeIngredientsArray withServingSize:1 withTotalCookTime:25];
    //add this recipe to the main array
    [recipeSingleton.AllMyRecipeTab addObject:myRecipe];
    
}
-(void)LoadRecipe2
{
    Recipes *CreateArrayRecipe = [[Recipes alloc]initDefaults];
    
    //Create Cooking Steps Array...
    NSArray *descriptionArray = @[@"Melt chocolate chips and coconut oil in the microwave about 1 minute (depending on your microwave). Allow to sit a few minutes.",@"Pour into a bottle. We used a recycled pickle relish bottle. (We recommend a glass bottle if you’re gonna refrigerate and then heat.)",@"Store in the refrigerator. To serve, heat the glass bottle (open cap) in the microwave for 30 seconds until liquid. Stir and continue heating at 30 second intervals if not liquid after the first 30 seconds, then pour."];
    //Create Timer Array...
    NSArray *timerArray = @[@5,@5,@60];
    
    //Pass arrays to helper function...
    NSMutableArray *recipeStepArray = [CreateArrayRecipe createCookingStepsArray:(NSMutableArray*)descriptionArray withTimerArray:timerArray];
    
    
    //Create Ingredients Array...
    NSArray *IngredientsArray = @[@"Cups of chocolate chips",@"Cup of coconut oil"];
    //Create IngredientAmountsArray...
    NSArray *IngredientAmountsArray = @[@1,@1];
    
    NSMutableArray *recipeIngredientsArray = [CreateArrayRecipe createIngredientsArray:(NSMutableArray*)IngredientsArray withAmountArray:(NSMutableArray*)IngredientAmountsArray];
    
    //Pass Ingredients and Cooking steps array to Master array of Recipies
    //using helper function initWithTitle...
    Recipes *myRecipe = [[ Recipes alloc]initWithTitle:(NSMutableString*)@"Magic Shell Ice Cream" withDescription:(NSMutableString*)@"Ice cream coated with Hershey's chocolate." withImage:[UIImage imageNamed: @"Recipe2"] withCategory:(NSMutableString*)@"Tropical" withSteps:recipeStepArray withIngredients:recipeIngredientsArray withServingSize:1 withTotalCookTime:70];
    //add this recipe to the main array
    [recipeSingleton.AllMyRecipeTab addObject:myRecipe];
}
-(void)LoadRecipe3
{
    Recipes *CreateArrayRecipe = [[Recipes alloc]initDefaults];
    
    //Create Cooking Steps Array...
    NSArray *descriptionArray = @[@"If you’re camping, do this before you leave home: Whirl pistachios and arugula in a food processor until minced. Add butter and whirl until smooth, scraping down inside of bowl as needed. Transfer to a small container and chill.",@"Heat a charcoal or wood-fired grill to high (450° to 550°). Coat steaks and asparagus with oil and season with salt and pepper. Grill steaks, turning once, until done the way you like.  Grill asparagus in last few minutes, turning once, until tender-crisp.",@"Transfer everything to a cutting board, dollop steaks with butter, and tent with foil. Let rest 5 minutes. Slice steaks and serve with asparagus."];
    //Create Timer Array...
    NSArray *timerArray = @[@5,@20,@5];
    
    //Pass arrays to helper function...
    NSMutableArray *recipeStepArray = [CreateArrayRecipe createCookingStepsArray:(NSMutableArray*)descriptionArray withTimerArray:timerArray];
    
    
    //Create Ingredients Array...
    NSArray *IngredientsArray = @[@"cup of shelled, roasted unsalted pistachios",@"cup of arugula",@"cup of softened butter",@"boneless rib-eye steaks (12 oz. each)",@"pound of asparagus, trimmed",@"tablespoons of olive oil",@"teaspoons of kosher salt",@"teaspoons of pepper"];
    //Create IngredientAmountsArray...
    NSArray *IngredientAmountsArray = @[@1,@1,@1,@2,@1,@2,@2,@2];
    
    NSMutableArray *recipeIngredientsArray = [CreateArrayRecipe createIngredientsArray:(NSMutableArray*)IngredientsArray withAmountArray:(NSMutableArray*)IngredientAmountsArray];
    
    //Pass Ingredients and Cooking steps array to Master array of Recipies
    //using helper function initWithTitle...
    Recipes *myRecipe = [[ Recipes alloc]initWithTitle:(NSMutableString*)@"Rib-Eye Steaks with Pistachio Butter and Asparagus" withDescription:(NSMutableString*)@"Flavorful and generously marbled, rib-eye makes a restaurant-worthy splurge whether at home or out camping, particularly when topped with a distinctively flavored butter. " withImage:[UIImage imageNamed: @"Recipe3"] withCategory:(NSMutableString*)@"Tropical" withSteps:recipeStepArray withIngredients:recipeIngredientsArray withServingSize:1 withTotalCookTime:30];
    //add this recipe to the main array
    [recipeSingleton.AllMyRecipeTab addObject:myRecipe];
}
-(void)LoadRecipe4
{
    Recipes *CreateArrayRecipe = [[Recipes alloc]initDefaults];
    
    //Create Cooking Steps Array...
    NSArray *descriptionArray = @[@"Stir ingredients together.",@"Pour finished mixture into a piping bag.  Set bag in the freezer.",@"Squeeze to cup and serve."];
    //Create Timer Array...
    NSArray *timerArray = @[@5,@20,@1];
    
    //Pass arrays to helper function...
    NSMutableArray *recipeStepArray = [CreateArrayRecipe createCookingStepsArray:(NSMutableArray*)descriptionArray withTimerArray:timerArray];
    
    
    //Create Ingredients Array...
    NSArray *IngredientsArray = @[@"cups of plain, vanilla, or flavored yogurt of choice.",@"sweetener",@"teaspoon of pure vanilla extract"];
    //Create IngredientAmountsArray...
    NSArray *IngredientAmountsArray = @[@3,@1,@1];
    
    NSMutableArray *recipeIngredientsArray = [CreateArrayRecipe createIngredientsArray:(NSMutableArray*)IngredientsArray withAmountArray:(NSMutableArray*)IngredientAmountsArray];
    
    //Pass Ingredients and Cooking steps array to Master array of Recipies
    //using helper function initWithTitle...
    Recipes *myRecipe = [[ Recipes alloc]initWithTitle:(NSMutableString*)@"Homemade Frozen Yogurt" withDescription:(NSMutableString*)@"Simply frozen treat." withImage:[UIImage imageNamed: @"Recipe4"] withCategory:(NSMutableString*)@"Tropical" withSteps:recipeStepArray withIngredients:recipeIngredientsArray withServingSize:3 withTotalCookTime:26];
    //add this recipe to the main array
    [recipeSingleton.AllMyRecipeTab addObject:myRecipe];
}
-(void)LoadRecipe5
{
    Recipes *CreateArrayRecipe = [[Recipes alloc]initDefaults];
    
    //Create Cooking Steps Array...
    NSArray *descriptionArray = @[@"Shred s small pile of cheese into a circle onto a baking pan.  Spread out the pile of cheese evenly.",@"Crumble up 2 cheese nips over the shredded cheddar circle.  Distribute evenly.",@"Pre-heat oven to 375 and place cheese nips inside.",@"Let nips cool and remove carefully with spatula."];
    //Create Timer Array...
    NSArray *timerArray = @[@10,@10,@5,@5];
    
    //Pass arrays to helper function...
    NSMutableArray *recipeStepArray = [CreateArrayRecipe createCookingStepsArray:(NSMutableArray*)descriptionArray withTimerArray:timerArray];
    
    //Create Ingredients Array...
    NSArray *IngredientsArray = @[@"block of cheddar or Colby jack cheese",@"packaged baked cheese nips"];
    //Create IngredientAmountsArray...
    NSArray *IngredientAmountsArray = @[@1,@1];
    
    NSMutableArray *recipeIngredientsArray = [CreateArrayRecipe createIngredientsArray:(NSMutableArray*)IngredientsArray withAmountArray:(NSMutableArray*)IngredientAmountsArray];
    
    //Pass Ingredients and Cooking steps array to Master array of Recipies
    //using helper function initWithTitle...
    Recipes *myRecipe = [[ Recipes alloc]initWithTitle:(NSMutableString*)@"Cheese Crisps" withDescription:(NSMutableString*)@"Oven-baked appetizers." withImage:[UIImage imageNamed: @"Recipe5"] withCategory:(NSMutableString*)@"Tropical" withSteps:recipeStepArray withIngredients:recipeIngredientsArray withServingSize:6 withTotalCookTime:30];
    //add this recipe to the main array
    [recipeSingleton.AllMyRecipeTab addObject:myRecipe];
}
-(void)LoadRecipe6
{
    Recipes *CreateArrayRecipe = [[Recipes alloc]initDefaults];
    
    //Create Cooking Steps Array...
    NSArray *descriptionArray = @[@"Preheat an oven to 350 degrees F (175 degrees C). Line a non insulated cookie sheet with parchment paper.",@"With a knife or kitchen shears carefully remove the leaves from the thick stems and tear into bite size pieces. Wash and thoroughly dry kale with a salad spinner. Drizzle kale with olive oil and sprinkle with seasoning salt.",@"Bake until the edges brown but are not burnt, 10 to 15 minutes."];
    //Create Timer Array...
    NSArray *timerArray = @[@5,@5,@10];
    
    //Pass arrays to helper function...
    NSMutableArray *recipeStepArray = [CreateArrayRecipe createCookingStepsArray:(NSMutableArray*)descriptionArray withTimerArray:timerArray];
    
    //Create Ingredients Array...
    NSArray *IngredientsArray = @[@"bunch kale",@"teaspoon of seasoned salt"];
    //Create IngredientAmountsArray...
    NSArray *IngredientAmountsArray = @[@1,@1];
    
    NSMutableArray *recipeIngredientsArray = [CreateArrayRecipe createIngredientsArray:(NSMutableArray*)IngredientsArray withAmountArray:(NSMutableArray*)IngredientAmountsArray];
    
    //Pass Ingredients and Cooking steps array to Master array of Recipies
    //using helper function initWithTitle...
    Recipes *myRecipe = [[ Recipes alloc]initWithTitle:(NSMutableString*)@"Baked Kale Chips" withDescription:(NSMutableString*)@"Low calorie nutritious snack.  Good for parties." withImage:[UIImage imageNamed: @"Recipe6"] withCategory:(NSMutableString*)@"Cold" withSteps:recipeStepArray withIngredients:recipeIngredientsArray withServingSize:6 withTotalCookTime:20];
    //add this recipe to the main array
    [recipeSingleton.AllMyRecipeTab addObject:myRecipe];
}
-(void)LoadRecipe7
{
    Recipes *CreateArrayRecipe = [[Recipes alloc]initDefaults];
    
    //Create Cooking Steps Array...
    NSArray *descriptionArray = @[@"Melt chocolate in microwave (Use about 1 Tablespoon shortening) or vegetable oil to thin it out if it is too think for dipping.)",@"Dip cookies into mint white chocolate. Garnish with sprinkles if desired. Let cool."];
    //Create Timer Array...
    NSArray *timerArray = @[@5,@15];
    
    //Pass arrays to helper function...
    NSMutableArray *recipeStepArray = [CreateArrayRecipe createCookingStepsArray:(NSMutableArray*)descriptionArray withTimerArray:timerArray];
    
    //Create Ingredients Array...
    NSArray *IngredientsArray = @[@"box of Vanilla Wafer Cookies (such as Nilla Wafers)",@"cups of mint white chocolate candy melts",@"Box of sprinkles"];
    //Create IngredientAmountsArray...
    NSArray *IngredientAmountsArray = @[@1,@2,@1];
    
    NSMutableArray *recipeIngredientsArray = [CreateArrayRecipe createIngredientsArray:(NSMutableArray*)IngredientsArray withAmountArray:(NSMutableArray*)IngredientAmountsArray];
    
    //Pass Ingredients and Cooking steps array to Master array of Recipies
    //using helper function initWithTitle...
    Recipes *myRecipe = [[ Recipes alloc]initWithTitle:(NSMutableString*)@"White Thin Mints" withDescription:(NSMutableString*)@"Two-ingredient white chocolate cookies." withImage:[UIImage imageNamed: @"Recipe7"] withCategory:(NSMutableString*)@"Cold" withSteps:recipeStepArray withIngredients:recipeIngredientsArray withServingSize:4 withTotalCookTime:20];
    //add this recipe to the main array
    [recipeSingleton.AllMyRecipeTab addObject:myRecipe];
}
-(void)LoadRecipe8
{
    Recipes *CreateArrayRecipe = [[Recipes alloc]initDefaults];
    
    //Create Cooking Steps Array...
    NSArray *descriptionArray = @[@"Make your marinate with the ginger ale and mustard.",@"Slice ham in diamonds on the top.  Make cuts ½ inch into the ham length and width-wise.",@"Pour marinade over ham.  Let it seep into the cuts.  Cook ham according to it's package directions.  During the cooking process use a baster or sppon to remove the juice and place the juice over the ham again."];
    //Create Timer Array...
    NSArray *timerArray = @[@5,@10,@95];
    
    //Pass arrays to helper function...
    NSMutableArray *recipeStepArray = [CreateArrayRecipe createCookingStepsArray:(NSMutableArray*)descriptionArray withTimerArray:timerArray];

    //Create Ingredients Array...
    NSArray *IngredientsArray = @[@"tablespoons of ginger ale",@"tablespoons of mustard"];
    //Create IngredientAmountsArray...
    NSArray *IngredientAmountsArray = @[@10,@5];
    
    NSMutableArray *recipeIngredientsArray = [CreateArrayRecipe createIngredientsArray:(NSMutableArray*)IngredientsArray withAmountArray:(NSMutableArray*)IngredientAmountsArray];
    
    //Pass Ingredients and Cooking steps array to Master array of Recipies
    //using helper function initWithTitle...
    Recipes *myRecipe = [[ Recipes alloc]initWithTitle:(NSMutableString*)@"Ham Marinade" withDescription:(NSMutableString*)@"Ham glazed with ginger ale and mustard." withImage:[UIImage imageNamed: @"Recipe8"] withCategory:(NSMutableString*)@"Cold" withSteps:recipeStepArray withIngredients:recipeIngredientsArray withServingSize:6 withTotalCookTime:110];
    //add this recipe to the main array
    [recipeSingleton.AllMyRecipeTab addObject:myRecipe];
}
-(void)LoadRecipe9
{
    Recipes *CreateArrayRecipe = [[Recipes alloc]initDefaults];
    
    //Create Cooking Steps Array...
    NSArray *descriptionArray = @[@"To Marinate: Pour salad dressing into a large, resealable plastic bag. Add chicken breasts, seal bag and shake to coat. Place in refrigerator for at least 1 hour or overnight.",@"Preheat oven to 350 degrees F (175 degrees C).",@"Remove chicken from bag, discarding remaining marinade. Place chicken in a lightly greased 9x13 inch baking dish and bake at 350 degrees F (175 degrees C) for 1 hour.  Turn chicken occasionally while baking."];
    //Create Timer Array...
    NSArray *timerArray = @[@65,@10,@60];
    
    //Pass arrays to helper function...
    NSMutableArray *recipeStepArray = [CreateArrayRecipe createCookingStepsArray:(NSMutableArray*)descriptionArray withTimerArray:timerArray];
    
    //Create Ingredients Array...
    NSArray *IngredientsArray = @[@"skinless, boneless chicken breast halves",@"bottle of Italian-style salad dressing"];
    //Create IngredientAmountsArray...
    NSArray *IngredientAmountsArray = @[@6,@1];
    
    NSMutableArray *recipeIngredientsArray = [CreateArrayRecipe createIngredientsArray:(NSMutableArray*)IngredientsArray withAmountArray:(NSMutableArray*)IngredientAmountsArray];
    
    //Pass Ingredients and Cooking steps array to Master array of Recipies
    //using helper function initWithTitle...
    Recipes *myRecipe = [[ Recipes alloc]initWithTitle:(NSMutableString*)@"Easy Italian Chicken II" withDescription:(NSMutableString*)@"Chicken breasts marinated and baked with Italian-style salad dressing." withImage:[UIImage imageNamed: @"Recipe9"] withCategory:(NSMutableString*)@"Moderate" withSteps:recipeStepArray withIngredients:recipeIngredientsArray withServingSize:6 withTotalCookTime:135];
    //add this recipe to the main array
    [recipeSingleton.AllMyRecipeTab addObject:myRecipe];
}
-(void)LoadRecipe10
{
    Recipes *CreateArrayRecipe = [[Recipes alloc]initDefaults];
    
    //Create Cooking Steps Array...
    NSArray *descriptionArray = @[@"Desc: Grease an 8 inch round springform pan.  Then line with parchment paper on sides and on bottom.  Preheat oven to 350F. Beat eggs on highest speed with stand mixer until about triple in volume.  Eggs must be beaten until triple in volume as that is what creates the cake.",@"Microwave Nutella for about 20 seconds to make it softer. Add in 1/3 of the egg mixture. Gently stir with a spatula in the same clockwise direction until all of the egg is mixed in and no streaks remain. Then add another 1/3 of egg mixture and fold again until no egg streaks remain. Pour in remaining third and make sure to scrape the foam that sticks to the mixing bowl into the batter and stir until no streaks remain. Do this in 3 batches.",@"Pour batter into springfoam pan. Bake for 20-25 minutes until knife inserted comes out clean. Let cake cool completely before removing from pan and cutting and serving."];
    //Create Timer Array...
    NSArray *timerArray = @[@5,@5,@25];
    
    //Pass arrays to helper function...
    NSMutableArray *recipeStepArray = [CreateArrayRecipe createCookingStepsArray:(NSMutableArray*)descriptionArray withTimerArray:timerArray];

    //Create Ingredients Array...
    NSArray *IngredientsArray = @[@"large or extra large eggs",@"ounces of Nutella"];
    //Create IngredientAmountsArray...
    NSArray *IngredientAmountsArray = @[@4,@9];
    
    NSMutableArray *recipeIngredientsArray = [CreateArrayRecipe createIngredientsArray:(NSMutableArray*)IngredientsArray withAmountArray:(NSMutableArray*)IngredientAmountsArray];
    
    //Pass Ingredients and Cooking steps array to Master array of Recipies
    //using helper function initWithTitle...
    Recipes *myRecipe = [[ Recipes alloc]initWithTitle:(NSMutableString*)@"FLOURLESS NUTELLA CAKE" withDescription:(NSMutableString*)@"Simple dish made of nutella and eggs." withImage:[UIImage imageNamed: @"Recipe10"] withCategory:(NSMutableString*)@"Moderate" withSteps:recipeStepArray withIngredients:recipeIngredientsArray withServingSize:4 withTotalCookTime:35];
    //add this recipe to the main array
    [recipeSingleton.AllMyRecipeTab addObject:myRecipe];
}

@end
