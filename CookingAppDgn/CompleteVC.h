//
//  CompleteVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompleteVC : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)postFacebook:(UIButton *)sender;
- (IBAction)postTwitter:(UIButton *)sender;
- (IBAction)NoThanksPress:(UIButton *)sender;
@end
