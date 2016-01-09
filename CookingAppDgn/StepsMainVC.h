//
//  StepsMainVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StepsMainVC : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIProgressView *totalProgressView;
@property (strong, nonatomic) IBOutlet UITableView *allStepsTableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *pausePlayButton;

- (IBAction)pausePlayPress:(UIBarButtonItem *)sender;
- (IBAction)skipPress:(UIBarButtonItem *)sender;
- (IBAction)cancelPress:(UIBarButtonItem *)sender;
@end
