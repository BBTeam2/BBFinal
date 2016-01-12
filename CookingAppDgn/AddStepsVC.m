//
//  AddStepsVC.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "AddStepsVC.h"
#import "Recipes.h"
#import "CookingSteps.h"
#import "AllRecipesVC.h"
#import "SetupStepVC.h"
#import "StartNewRecipeVC.h"
#import "AddIngredientsVC.h"
@interface AddStepsVC ()

@end

@implementation AddStepsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //make sure singleton is set up
    recipeSingleton = [AllRecipeSingleton objectManager];
    // Do any additional setup after loading the view.
    self.stepsRecipe = self.stepsSomeRecipe;
    
    //load the tableView
    [self.currentStepsTableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -TableView Methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddCurrentStepCell"];
    
    cell.textLabel.text = [self.stepsRecipe.arrSteps[indexPath.row] strDescription];
    NSString *timer = [NSString stringWithFormat:@"%ld min(s)",[self.stepsRecipe.arrSteps[indexPath.row] intTimerLength]];
    cell.detailTextLabel.text = timer;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.stepsRecipe.arrSteps count];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]isEqualToString:@"CreateSetupInstruction"]) {
        SetupStepVC *destinationVC = segue.destinationViewController;
        destinationVC.someVC = self;
    }
}


- (IBAction)DonePress:(UIBarButtonItem *)sender {
    
    //calculate the totaltime of cooking
    [self.stepsRecipe CalculateTotalCookTime];
    //we add our whole recipe

    [recipeSingleton.AllMyRecipeTab addObject:self.stepsRecipe];

    
    //Grab the root view controller and reset all the items in the  textfields
    StartNewRecipeVC *Tab3View1VC = [[self.navigationController childViewControllers]objectAtIndex:0];
    [Tab3View1VC.categorySegmentCntrl setSelectedSegmentIndex:-1];
    Tab3View1VC.titleTextField.text = @"";
    Tab3View1VC.descriptionTextView.text = @"";
    Tab3View1VC.servingSizeTextField.text = @"";
    Tab3View1VC.tempRecipe = nil;
    
    //AddIngredientsVC *tab3View2VC = [[self.navigationController childViewControllers]objectAtIndex:1];
    
    
    
    
    //once everything is saved pop to the RootViewController
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
