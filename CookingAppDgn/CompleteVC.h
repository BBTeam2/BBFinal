//
//  CompleteVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
@interface CompleteVC : UIViewController
{SLComposeViewController *slCVC;}
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) id someImage;
@property (strong, nonatomic) id someName;

- (IBAction)postFacebook:(UIButton *)sender;
- (IBAction)postTwitter:(UIButton *)sender;
- (IBAction)NoThanksPress:(UIButton *)sender;
@end
