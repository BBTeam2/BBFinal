//
//  SuggestedRecipeVC.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "SuggestedRecipeVC.h"
#import "SugRecipeCustomCell.h"
#import "Recipes.h"
#import "CurrentSelectedVC.h"

@interface SuggestedRecipeVC ()

@end

@implementation SuggestedRecipeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //make sure singleton is set up
    recipeSingleton = [AllRecipeSingleton objectManager];
    self.arrSuggestRecipe = [[NSMutableArray alloc]init];
    [self LoadRecipeArray];
    [self.suggestedReceipeTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Loading Functions
//Load all of our recipes
-(void)LoadRecipeArray
{
    [self ArrangeByTemperature];
}
//Once we have our array stored we will need to arrange or restructure the array based on the current
//temperature
-(void)ArrangeByTemperature
{
    //grab the temperature
    //set a string to a category based on the temperature
    //loop thru array and set the current recipe to the new array we will be using.
    
}

#pragma mark TableView Functions
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SugRecipeCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SugRecipeCell"];
    
    cell.cellImageView.image = [self.arrSuggestRecipe[indexPath.row] uiImage];
    cell.titleLabel.text = [self.arrSuggestRecipe[indexPath.row] strTitle];
    cell.descripLabel.text = [self.arrSuggestRecipe[indexPath.row] strDescription];
    // the tag will be our identifier when a button is pressed (so we can segue
    // to the correct part of the array
    cell.viewButton.tag = indexPath.row;
    [cell.viewButton addTarget:self action:@selector(prepareForSegue:sender:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrSuggestRecipe.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //this is the specific Recipe we are passing to the next view
    
    if ([[segue identifier] isEqualToString:@"Tab3ToCurrent"]) {
        NSInteger index = [(UIButton*)sender tag];
        Recipes* CurrentRecipe = self.arrSuggestRecipe[index];
        CurrentSelectedVC *destinationVC =  segue.destinationViewController;
        destinationVC.currentRecipe = CurrentRecipe;
        
    }
    
}


@end
