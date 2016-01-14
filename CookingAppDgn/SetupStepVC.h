//
//  SetupStepVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CookingSteps.h"
#import "AllRecipeSingleton.h"
@interface SetupStepVC : UIViewController<UITextViewDelegate>
{
    AllRecipeSingleton *recipeSingleton;
}
//properties
@property (strong, nonatomic) IBOutlet UITextView *instructionTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *stepDatePicker;
@property (strong, nonatomic) id someVC;
- (IBAction)DonePress:(UIBarButtonItem *)sender;

@end
