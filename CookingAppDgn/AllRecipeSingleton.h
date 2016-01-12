//
//  AllRecipeSingleton.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/11/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllRecipeSingleton : NSObject
@property (retain,nonatomic) NSMutableArray *AllMyRecipeTab;

+(id)objectManager;

@end
