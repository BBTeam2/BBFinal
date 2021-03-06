//
//  SetupStepVC.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "SetupStepVC.h"
#import "AddStepsVC.h"
#import "Recipes.h"
@interface SetupStepVC ()

@end

@implementation SetupStepVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //make sure singleton is set up
    recipeSingleton = [AllRecipeSingleton objectManager];
    self.instructionTextView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TextField and TextView Protocals
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)DonePress:(UIBarButtonItem *)sender {
    AddStepsVC *previousVC = self.someVC;
    NSTimeInterval countdown = self.stepDatePicker.countDownDuration;
    NSInteger minutes = floor(countdown/60);
    
    CookingSteps *newStep = [[CookingSteps alloc]initWithDescription:(NSMutableString*)self.instructionTextView.text withTimeAmount:minutes];
    
    [previousVC.stepsRecipe.arrSteps addObject:newStep];
    
    //load the table view
    [previousVC.currentStepsTableView reloadData];
    //play some sweet sounds
    [recipeSingleton.cookingSound playSound];
    //Pop the navigation controller stack
    [self.navigationController popViewControllerAnimated:YES];
}
@end
