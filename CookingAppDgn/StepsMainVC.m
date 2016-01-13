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
    
    //set the current active step(default value)
    self.currentActiveStep = 0;
    //this will hold how many seconds initially
    self.currenActiveTimer = [self.myStepsRecipe.arrSteps[self.currentActiveStep] intTimerLength]*60;
    //now we can start our timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(CountDown) userInfo:nil repeats:YES];
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
#pragma mark NSTimer functions
-(void)StartTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(CountDown) userInfo:nil repeats:YES];
}
-(void)CountDown
{
    self.currenActiveTimer -=1;
    if (self.currenActiveTimer == 0) {
        [self.myStepsRecipe.arrSteps[self.currentActiveStep] setIsComplete:YES];
        self.CompleteTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(CheckIfRecipeIsComplete) userInfo:nil repeats:NO];
        [self.timer invalidate];
        
    }
    //reload the tableview
    [self.allStepsTableView reloadData];
}

#pragma mark TableView Function
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StepTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StepCell"];
    
    cell.InstructionLabel.text = [self.myStepsRecipe.arrSteps[indexPath.row] strDescription];
    //**This will need to be updated for tableView when we add an nsTimer
    //This will set all the labels once they are done
    if ([self.myStepsRecipe.arrSteps[indexPath.row] isComplete] ) {
        cell.timerLabel.text = [NSString stringWithFormat:@"Complete"];
    }
    else
    {
        if (indexPath.row == self.currentActiveStep) {
            NSInteger seconds = self.currenActiveTimer % 60;
            NSInteger minutes = (self.currenActiveTimer / 60) % 60;
            NSInteger hours = (self.currenActiveTimer / 3600);
            cell.timerLabel.text = [NSString stringWithFormat:@"%ld:%ld:%ld",hours,minutes,seconds];
        }
        else
        {
            NSInteger tempTimer = (long)[self.myStepsRecipe.arrSteps[indexPath.row] intTimerLength]*60;
            NSInteger minutes = (tempTimer / 60) % 60;
            NSInteger hours = (tempTimer / 3600);
            cell.timerLabel.text = [NSString stringWithFormat:@"%ld:%ld",hours,minutes];
        }
    }

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
        [self performSegueWithIdentifier:@"FinalTab" sender:self];
        
    }
    else
    {
        [self.allStepsTableView reloadData];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Pass the selected object to the new view controller.
    if ([[segue identifier]isEqualToString:@"FinalTab"]) {
        CompleteVC *destinationVC = segue.destinationViewController;
        destinationVC.someImage = [self.myStepsRecipe uiImage];
        destinationVC.someName = self.myStepsRecipe.strTitle;
        
    }

}

#pragma mark -Button Press


- (IBAction)PausePress:(UIBarButtonItem *)sender {
    //The Pause button has been pressed
    if (self.isPausePlay) {
        UIBarButtonItem *play = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(PlayPress:)];
        
        NSMutableArray *newNavBar = [self.navigationItem.rightBarButtonItems mutableCopy];
        [newNavBar replaceObjectAtIndex:2 withObject:play];
        
        self.navigationItem.rightBarButtonItems = newNavBar;
        self.isPausePlay= NO;
        //stop the timer
        [self.timer invalidate];
        //reload the tableview
        [self.allStepsTableView reloadData];
    }
    
}

- (IBAction)skipPress:(UIBarButtonItem *)sender {
    //have the current item we are going to skip
    //force the timer to end and go to the next step and begin the counter for that item
    [self.timer invalidate];
    [self.myStepsRecipe.arrSteps[self.currentActiveStep] setIsComplete:YES];
    //set the current active step to the next step
    self.currentActiveStep += 1;
    //reset the currentTimer to new value(dont forget to set it to seconds.
    if ([self.myStepsRecipe.arrSteps count] > self.currentActiveStep) {
        self.currenActiveTimer = [self.myStepsRecipe.arrSteps[self.currentActiveStep] intTimerLength]*60;
        //start the new timer
        [self StartTimer];
    }
    //There are no more steps we are done here
    else
    {
        [self CheckIfRecipeIsComplete ];
    }

    
}

- (IBAction)cancelPress:(UIBarButtonItem *)sender {
    //post an UIAlert that will inform the user that they will stop the entire cooking proccess without any chance of undoing this
    //reset the current active step
    //stop the timer
    [self.timer invalidate];
    self.currentActiveStep = 0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)PlayPress:(UIBarButtonItem *)sender {
    if (self.isPausePlay == NO) {
        UIBarButtonItem *pause = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(PausePress:)];
        
        NSMutableArray *newNavBar = [self.navigationItem.rightBarButtonItems mutableCopy];
        [newNavBar replaceObjectAtIndex:2 withObject:pause];
        
        self.navigationItem.rightBarButtonItems = newNavBar;
        self.isPausePlay= YES;
        //start the timer again
        [self StartTimer];
    }
}
@end
