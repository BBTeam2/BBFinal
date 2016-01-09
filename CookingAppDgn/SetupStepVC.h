//
//  SetupStepVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetupStepVC : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *instructionTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *stepDatePicker;
- (IBAction)DonePress:(UIBarButtonItem *)sender;

@end
