//
//  AddStepsVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddStepsVC : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *currentStepsTableView;

- (IBAction)DonePress:(UIBarButtonItem *)sender;
@end
