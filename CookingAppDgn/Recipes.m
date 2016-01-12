//
//  Recipes.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "Recipes.h"
#import "CookingSteps.h"
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
