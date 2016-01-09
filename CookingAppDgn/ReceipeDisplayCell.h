//
//  ReceipeDisplayCell.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceipeDisplayCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *cellImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descripLabel;
@property (strong, nonatomic) IBOutlet UIButton *ViewButton;

@end
