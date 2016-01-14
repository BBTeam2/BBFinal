//
//  Recipes.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "Recipes.h"
#import "CookingSteps.h"
#import "Ingredients.h"
@implementation Recipes

-(instancetype)initDefaults
{
    self = [super init];
    self.strTitle = [[NSMutableString alloc]init];
    self.strDescription = [[NSMutableString alloc]init];
    self.uiImage = [[UIImage alloc]init];
    self.strCategory = [[NSMutableString alloc]init];
    self.arrSteps = [[NSMutableArray alloc]init];
    self.arrIngredients = [[NSMutableArray alloc]init];
    self.intServingSize = 0;
    self.intTotalCookTime = 0;
    return self;
}

-(instancetype)initWithTitle:(NSMutableString *)name withDescription:(NSMutableString*)descript withImage:(UIImage*)image withCategory:(NSMutableString *)category withSteps:(NSMutableArray *)steps withIngredients:(NSMutableArray *)ingredients withServingSize:(NSInteger)servingSize withTotalCookTime:(NSInteger)totalCookTime{
    self = [super init];
    self.strTitle = name;
    self.strDescription = descript;
    self.uiImage = image;
    self.strCategory = category;
    self.arrSteps = steps;
    self.arrIngredients = ingredients;
    self.intServingSize = servingSize;
    self.intTotalCookTime = totalCookTime;
    
    return self;
}//EndRecipe initwithTitle...



-(NSMutableArray*)createCookingStepsArray:(NSMutableArray *)descriptionArray withTimerArray:(NSArray*)timerArray{
    
    NSMutableArray *cookingStepsArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i < descriptionArray.count; i++) {
        int  theAmount = [timerArray[i]intValue];
        CookingSteps *newCookingStep = [[CookingSteps alloc] initWithDescription: descriptionArray[i] withTimeAmount:(NSInteger)theAmount];
        
        [cookingStepsArray addObject:newCookingStep];
        
    }//EndFor...
    return cookingStepsArray;
}//EndCookingStepsArray...


-(NSMutableArray*)createIngredientsArray:(NSMutableArray *)ingredientsArray withAmountArray:(NSMutableArray*)amounts{
    
    NSMutableArray *ingrArray = [[NSMutableArray alloc]init];
    
    for(int y = 0; y < ingredientsArray.count; y++){
        int  theAmount = [amounts[y]intValue];
        Ingredients *newIngr = [[ Ingredients alloc] initWithName: ingredientsArray[y] withAmount:(NSInteger)theAmount];
        
        [ingrArray addObject:newIngr];
        
        
    }//EndFor...
    
    
    return ingrArray;
}//EndcreateIngredientsArray...
//Calculates the Total Cook Time for a Recipe based on the steps time
//Use this function only after you added all the steps to your array
-(void)CalculateTotalCookTime
{
    //reset the total cook time
    self.intTotalCookTime = 0;
    //check if steps are valid
    if ([self.arrSteps count] > 0)
    {
        for (int i = 0; i < self.arrSteps.count; i++) {
            self.intTotalCookTime += [self.arrSteps[i] intTimerLength];
        }
    }

}
@end
