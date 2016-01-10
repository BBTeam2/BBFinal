//
//  Recipes.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Recipes : NSObject
//Properties
@property (strong,nonatomic) NSMutableString* strTitle;
@property (strong,nonatomic) NSMutableString* strDescription;
@property (strong,nonatomic) UIImage* uiImage;
@property (strong,nonatomic) NSMutableString* strCategory;
@property (strong,nonatomic) NSMutableArray* arrSteps;
@property (strong,nonatomic) NSMutableArray* arrIngredients;
@property                    NSInteger intServingSize;
@property                    NSInteger intTotalCookTime;

//methods
-(instancetype)initDefaults;
-(void)CalculateTotalCookTime;

@end
