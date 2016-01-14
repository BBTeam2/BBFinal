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
    NSURL *soundClip = [[NSBundle mainBundle]URLForResource:@"fingerClick" withExtension:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)soundClip, &sdTransistion);
    AudioServicesPlaySystemSound(sdTransistion);
}


-(void)playSound2{
    SystemSoundID sdTransistion;
    NSURL *soundClip = [[NSBundle mainBundle]URLForResource:@"swords" withExtension:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)soundClip, &sdTransistion);
    AudioServicesPlaySystemSound(sdTransistion);
}

-(void)playSound3{
    SystemSoundID sdTransistion;
    NSURL *soundClip = [[NSBundle mainBundle]URLForResource:@"swords" withExtension:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)soundClip, &sdTransistion);
    AudioServicesPlaySystemSound(sdTransistion);
}

-(void)playSound4{
    SystemSoundID sdTransistion;
    NSURL *soundClip = [[NSBundle mainBundle]URLForResource:@"whipWhosp" withExtension:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)soundClip, &sdTransistion);
    AudioServicesPlaySystemSound(sdTransistion);
}

//**Cheering sound for completing StepsMain.m goes here.
-(void)playSound5{
    SystemSoundID sdTransistion;
    NSURL *soundClip = [[NSBundle mainBundle]URLForResource:@"5_Sec_Crowd_Cheer-Mike_Koenig" withExtension:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)soundClip, &sdTransistion);
    AudioServicesPlaySystemSound(sdTransistion);
}
@end
