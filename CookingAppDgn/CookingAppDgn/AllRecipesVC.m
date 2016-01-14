//
//  AllRecipeVC.m
//  CookingAppDgn
//
//  Created by iOS on 1/4/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "AllRecipesVC.h"
#import "RecipeDisplayCell.h"
#import "Recipes.h"
#import "CurrentSelectedVC.h"
@interface AllRecipesVC ()

@end

@implementation AllRecipesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //make sure singleton is set up
    recipeSingleton = [AllRecipeSingleton objectManager];
    //setup the AllrecipeArray
    self.arrAllRecipe = recipeSingleton.AllMyRecipeTab;
    //set the singletonID to hold this tabs navigation controller;
    recipeSingleton.FirstTabNavController = self.navigationController;
    //load the array
    [self LoadRecipeArray];
    //load the tableview
    [self.allReceipeTableView reloadData];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    //make sure the array is accurate
    self.arrAllRecipe = recipeSingleton.AllMyRecipeTab;
    [self.allReceipeTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Loading Functions
//Load all of our recipes
-(void)LoadRecipeArray
{
    
}

#pragma mark TableView Functions
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecipeDisplayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AllRecipeCell"];
    
    cell.cellImageView.image = [self.arrAllRecipe[indexPath.row] uiImage];
    cell.titleLabel.text = [self.arrAllRecipe[indexPath.row] strTitle];
    cell.descripLabel.text = [self.arrAllRecipe[indexPath.row] strDescription];
    // the tag will be our identifier when a button is pressed (so we can segue
    // to the correct part of the array
    cell.ViewButton.tag = indexPath.row;
    [cell.ViewButton addTarget:self action:@selector(LetsPush:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrAllRecipe.count;
}

-(void)LetsPush:(UIButton*)sender
{
    //lets check if other tab is currently in the way
    
    [self performSegueWithIdentifier:@"Tab1ToCurrent" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //this is the specific Recipe we are passing to the next view
    
    if ([[segue identifier] isEqualToString:@"Tab1ToCurrent"]) {
        NSInteger index = [(UIButton*)sender tag];
        Recipes* CurrentRecipe = self.arrAllRecipe[index];
        CurrentSelectedVC *destinationVC =  segue.destinationViewController;
        destinationVC.currentRecipe = CurrentRecipe;
        
    }

}

@end
