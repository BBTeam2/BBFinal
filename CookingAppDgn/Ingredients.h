//
//  Ingredients.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ingredients : NSObject
//properties
@property(strong,nonatomic) NSMutableString* strName;
@property                   NSInteger        intAmount;

-(instancetype)initWithName:(NSMutableString*)name withAmount:(NSInteger)amount;
@end
