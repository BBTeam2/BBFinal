//
//  CurrentSelectedVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrentSelectedVC : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descripLabel;
@property (strong, nonatomic) IBOutlet UILabel *cookTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *servingSizeLabel;
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;
@property (strong, nonatomic) IBOutlet UITableView *ingredientTableView;

@end
