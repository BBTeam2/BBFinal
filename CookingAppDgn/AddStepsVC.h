//
//  AddStepsVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllRecipeSingleton.h"
@class Recipes;
@interface AddStepsVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    AllRecipeSingleton *recipeSingleton;
}
//properties
@property (strong, nonatomic) IBOutlet UITableView *currentStepsTableView;
@property (strong, nonatomic) id stepsSomeRecipe;
@property (strong, nonatomic) Recipes *stepsRecipe;
//methods

- (IBAction)DonePress:(UIBarButtonItem *)sender;
@end
