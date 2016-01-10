//
//  Ingredients.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "Ingredients.h"

@implementation Ingredients

-(instancetype)initWithName:(NSMutableString *)name withAmount:(NSInteger)amount
{
    self = [super init];
    self.strName = name;
    self.intAmount = amount;
    return self;
}

@end
