//
//  StepsMainVC.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "StepsMainVC.h"
#import "StepTableViewCell.h"
#import "CookingSteps.h"
#import "CompleteVC.h"
@interface StepsMainVC ()

@end

@implementation StepsMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myStepsRecipe = self.stepRecipe;
    //initialize UI Elements
    [self initializeUI];
    //load the tableView
    [self.allStepsTableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeUI
{
    self.titleLabel.text = self.myStepsRecipe.strTitle;
    self.totalProgressView.progress = 0.0f;
    self.currentProgress = 0.0f;
    self.isPausePlay = YES;
}

#pragma mark TableView Function
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StepTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StepCell"];
    
    cell.InstructionLabel.text = [self.myStepsRecipe.arrSteps[indexPath.row] strDescription];
    //**This will need to be updated for tableView when we add an nsTimer
    
    if ([self.myStepsRecipe.arrSteps[indexPath.row] isComplete] ) {
        cell.timerLabel.text = [NSString stringWithFormat:@"Complete"];
    }
    else
    {
        cell.timerLabel.text = [NSString stringWithFormat:@"%ld",(long)[self.myStepsRecipe.arrSteps[indexPath.row] intTimerLength]];
    }
    //check if the Recipe is Done
    [self CheckIfRecipeIsComplete];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.myStepsRecipe.arrSteps count];
}

-(void)CheckIfRecipeIsComplete
{
    //check all the steps to make sure all steps are complete
    for (int i = 0; i < [self.myStepsRecipe.arrSteps count]; i++) {
        self.isRecipeComplete = [self.myStepsRecipe.arrSteps[i] isComplete];
    }
    if (self.isRecipeComplete == YES) {
        CompleteVC *completeVC = [[CompleteVC alloc]init];
        [self.navigationController pushViewController:completeVC animated:YES];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Pass the selected object to the new view controller.
    CompleteVC *destinationVC = segue.destinationViewController;
    destinationVC.someImage = [self.myStepsRecipe uiImage];
    destinationVC.someName = self.myStepsRecipe.strTitle;
    
}


- (IBAction)PausePress:(UIBarButtonItem *)sender {
    //The Pause button has been pressed
    if (self.isPausePlay) {
        self.pausePlayButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(PlayPress:)];
        //self.navigationItem.rightBarButtonItem = self.pausePlayButton;
        self.isPausePlay= NO;
    }

}

- (IBAction)skipPress:(UIBarButtonItem *)sender {
    //have the current item we are going to skip
    //force the timer to end and go to the next step and begin the counter for that item
    //
    
}

- (IBAction)cancelPress:(UIBarButtonItem *)sender {
    //post an UIAlert that will inform the user that they will stop the entire cooking proccess without any chance of undoing this
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)PlayPress:(UIBarButtonItem *)sender {
    if (self.isPausePlay == NO) {
        self.pausePlayButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(PausePress:)];
        //self.navigationItem.rightBarButtonItem = self.pausePlayButton;
        self.isPausePlay= YES;
    }
}
@end
