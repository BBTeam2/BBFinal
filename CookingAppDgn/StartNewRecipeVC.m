//
//  StartNewReceipeVC.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "StartNewRecipeVC.h"
#import "AddIngredientsVC.h"
#import "Recipes.h"

@interface StartNewRecipeVC ()

@end
NSCharacterSet *AlphaNumericSet;
NSCharacterSet *NumericSet;
@implementation StartNewRecipeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tempRecipe = [[Recipes alloc]initDefaults];
    AlphaNumericSet = [NSCharacterSet alphanumericCharacterSet];
    NumericSet = [NSCharacterSet decimalDigitCharacterSet];
    [self.categorySegmentCntrl setSelectedSegmentIndex:-1];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    if (self.tempRecipe == nil) {
        self.tempRecipe = [[Recipes alloc]initDefaults];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Assignment Functions
-(BOOL)AddTitle
{
    BOOL returnValue = NO;
    //check if the Entry is a valid entry
    NSString *currentTitle = self.titleTextField.text;
    if ([[currentTitle stringByTrimmingCharactersInSet:AlphaNumericSet] isEqualToString:@""]) {
        //this string is valid set it to our recipe
        [self.tempRecipe setStrTitle:(NSMutableString*)currentTitle];
        returnValue = YES;
    }
    else
    {
        //post a UIAlert
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Title can only be Letters or Numbers Only" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [av show];
        returnValue = NO;
    }
    return returnValue;
}

-(BOOL)AddDescription
{
    //description can be anything the user wants. Letters numbers or special characters
    NSString *currentDescription = self.descriptionTextView.text;
    
    [self.tempRecipe setStrDescription:(NSMutableString*)currentDescription];
    return YES;
}

-(BOOL)AddServingSize
{
    BOOL returnValue = NO;
    //check if the Entry is a valid entry
    NSString *currentServingSize = self.servingSizeTextField.text;
    if ([[currentServingSize stringByTrimmingCharactersInSet:NumericSet] isEqualToString:@""]) {
        //this string is valid set it to our recipe
        [self.tempRecipe setIntServingSize:[currentServingSize integerValue]];
        returnValue = YES;
    }
    else
    {
        //post a UIAlert
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Serving size should only be a number" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [av show];
        returnValue = NO;
    }
    return returnValue;
}

-(BOOL)AddCategory
{
    BOOL returnValue = NO;
    //check if we have a segment selected
    if ([self.categorySegmentCntrl selectedSegmentIndex] > -1) {
        //if something is selected
        NSInteger currentIndex = self.categorySegmentCntrl.selectedSegmentIndex;
        self.tempRecipe.strCategory = (NSMutableString*)[self.categorySegmentCntrl titleForSegmentAtIndex:currentIndex];
        returnValue = YES;
    }
    else
    {
        //post a UIAlert
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Error" message:@"No Category is selected" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [av show];
        returnValue = NO;
    }
    return returnValue;
}


#pragma mark - Navigation
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    BOOL returnValue = NO;
    
    returnValue = [self AddTitle];
    returnValue = [self AddDescription];
    returnValue = [self AddServingSize];
    returnValue = [self AddCategory];
    
    return returnValue;
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]isEqualToString:@"Phase1Complete"]) {
        AddIngredientsVC *destinationVC = segue.destinationViewController;
        destinationVC.someRecipe = self.tempRecipe;
    }
}


@end
