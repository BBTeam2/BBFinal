//
//  CookingSounds.m
//  CookingAppDgn
//
//  Created by iOS on 1/13/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "CookingSounds.h"

@implementation CookingSounds

-(void)playSound{
    SystemSoundID sdTransistion;
    NSURL *soundClip = [[NSBundle mainBundle]URLForResource:@"swords" withExtension:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)soundClip, &sdTransistion);
    AudioServicesPlaySystemSound(sdTransistion);
    
}

@end
