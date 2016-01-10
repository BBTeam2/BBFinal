//
//  CookingSteps.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "CookingSteps.h"

@implementation CookingSteps

-(instancetype)initWithDescription:(NSMutableString *)description withTimeAmount:(NSInteger)timerLength
{
    self = [super init];
    self.strDescription = description;
    self.intTimerLength = timerLength;
    
    return self;
}
@end
