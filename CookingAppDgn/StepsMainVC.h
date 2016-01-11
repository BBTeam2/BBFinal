//
//  StepsMainVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipes.h"

@interface StepsMainVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
//properties
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIProgressView *totalProgressView;
@property (strong, nonatomic) IBOutlet UITableView *allStepsTableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *pausePlayButton;
@property (strong, nonatomic) id stepRecipe;
@property (strong, nonatomic) Recipes *myStepsRecipe;
@property BOOL isPausePlay;
@property float currentProgress;
@property BOOL isRecipeComplete;

//methods
-(void)initializeUI;
-(void)CheckIfRecipeIsComplete;
- (IBAction)PausePress:(UIBarButtonItem *)sender;
- (IBAction)skipPress:(UIBarButtonItem *)sender;
- (IBAction)cancelPress:(UIBarButtonItem *)sender;
- (IBAction)PlayPress:(UIBarButtonItem *)sender;
@end
