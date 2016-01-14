//
//  AllRecipeVC.h
//  CookingAppDgn
//
//  Created by iOS on 1/4/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllRecipeSingleton.h"
@interface AllRecipesVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    AllRecipeSingleton *recipeSingleton;
}
//properties
@property (strong, nonatomic) IBOutlet UITableView *allReceipeTableView;
@property (strong, nonatomic) NSMutableArray* arrAllRecipe;


//methods
-(void)LoadRecipeArray;


//hard code functions for each Recipe
-(void)LoadRecipe1;
-(void)LoadRecipe2;
-(void)LoadRecipe3;
-(void)LoadRecipe4;
-(void)LoadRecipe5;
-(void)LoadRecipe6;
-(void)LoadRecipe7;
-(void)LoadRecipe8;
-(void)LoadRecipe9;
-(void)LoadRecipe10;

@end

