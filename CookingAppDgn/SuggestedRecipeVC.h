//
//  SuggestedRecipeVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllRecipeSingleton.h"
@interface SuggestedRecipeVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    AllRecipeSingleton *recipeSingleton;
}
//properties
@property (strong, nonatomic) IBOutlet UITableView *suggestedReceipeTableView;
@property (strong, nonatomic) NSMutableArray* arrSuggestRecipe;
@property NSInteger intCurrentTemp;

//methods
-(void)LoadRecipeArray;
@end
