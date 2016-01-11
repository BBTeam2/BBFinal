//
//  CookingSteps.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CookingSteps : NSObject
//properties
@property(strong,nonatomic) NSMutableString* strDescription;
@property                   NSInteger intTimerLength;
@property                   BOOL isComplete;

//methods
-(instancetype)initWithDescription:(NSMutableString*)description withTimeAmount:(NSInteger)timerLength;
@end
