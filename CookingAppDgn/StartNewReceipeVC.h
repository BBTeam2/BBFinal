//
//  StartNewReceipeVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartNewReceipeVC : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutlet UITextField *servingSizeTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *categorySegmentCntrl;

@end
