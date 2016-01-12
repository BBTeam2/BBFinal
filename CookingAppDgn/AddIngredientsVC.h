//
//  AddIngredientsVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Recipes;
@interface AddIngredientsVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
//properties
@property (strong, nonatomic) IBOutlet UITextField *IngredientTextField;
@property (strong, nonatomic) IBOutlet UITextField *amountTextField;
@property (strong, nonatomic) IBOutlet UITableView *ingredientsTableView;
@property (strong, nonatomic) id someRecipe;
@property (strong, nonatomic) Recipes *currentNewRecipe;

//Methods
-(NSString*)AddIngredientName;

-(NSInteger)AddIngredientAmount;

-(void)ClearTextFields;

- (IBAction)AddPress:(UIButton *)sender;
- (IBAction)RemovePress:(UIButton *)sender;
@end
