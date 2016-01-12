//
//  AllRecipeSingleton.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/11/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "AllRecipeSingleton.h"

@implementation AllRecipeSingleton

+(id)objectManager
{
    static AllRecipeSingleton *MasterListObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        MasterListObject = [[self alloc]init];
    });
    return MasterListObject;
}

-(id)init
{
    if (self = [super init]) {
        self.AllMyRecipeTab = [[NSMutableArray alloc]init];
        self.FirstTabNavController = nil;
        self.ThirdTabNavController = nil;
    }
    return self;
}
@end
