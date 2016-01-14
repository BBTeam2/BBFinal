//
//  CompleteVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import "AllRecipeSingleton.h"
@class Recipes;
@interface CompleteVC : UIViewController
{
    SLComposeViewController *slCVC;
    AllRecipeSingleton *recipeSingleton;
}
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) id someImage;
@property (strong, nonatomic) id someName;
@property (strong, nonatomic) id thisRecipe;
@property (strong, nonatomic) Recipes *finalRecipe;
- (IBAction)postFacebook:(UIButton *)sender;
- (IBAction)postTwitter:(UIButton *)sender;
- (IBAction)NoThanksPress:(UIButton *)sender;
@end
