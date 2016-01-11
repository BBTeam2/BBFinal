//
//  CurrentSelectedVC.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "CurrentSelectedVC.h"
#import "Ingredients.h"
#import "StepsMainVC.h"
@interface CurrentSelectedVC ()

@end

@implementation CurrentSelectedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myRecipe = self.currentRecipe;
    
    //initialize all the local UI
    [self initializeUI];
    
    //load the tableview
    [self.ingredientTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeUI
{
    self.imageView.image = self.myRecipe.uiImage;
    self.titleLabel.text = self.myRecipe.strTitle;
    self.descripLabel.text = self.myRecipe.strDescription;
    self.cookTimeLabel.text = [NSString stringWithFormat:@"Cooking Time:%ld minutes", (long)self.myRecipe.intTotalCookTime];
    self.servingSizeLabel.text = [NSString stringWithFormat:@"Serving Size: %ld",(long)self.myRecipe.intServingSize];
    self.categoryLabel.text = self.myRecipe.strCategory;
    
}

#pragma mark TableView Functions
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.myRecipe.arrIngredients count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IngredientCell"];
    NSMutableString *ingredientString = [[NSMutableString alloc]init];
    //set the variables on a controlled variable so it will be easier to read
    NSInteger currentAmount = [self.myRecipe.arrIngredients[indexPath.row] intAmount];
    NSString *currentName = [self.myRecipe.arrIngredients[indexPath.row] strName];
    [ingredientString appendString:[NSString stringWithFormat:@"%ld %@",(long)currentAmount, currentName]];
    //set the Title
    cell.textLabel.text = ingredientString;

    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"CurrentToStart"]) {
        StepsMainVC *stepVC = [segue destinationViewController];
        stepVC.stepRecipe = self.myRecipe;
    }

}


@end
