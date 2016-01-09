//
//  AddIngredientsVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddIngredientsVC : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *IngredientTextField;
@property (strong, nonatomic) IBOutlet UITextField *amountTextField;
@property (strong, nonatomic) IBOutlet UITableView *ingredientsTableView;

- (IBAction)AddPress:(UIButton *)sender;
- (IBAction)RemovePress:(UIButton *)sender;
@end
