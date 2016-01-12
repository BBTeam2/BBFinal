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

@end

