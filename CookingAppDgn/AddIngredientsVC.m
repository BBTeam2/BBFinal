//
//  AddIngredientsVC.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "AddIngredientsVC.h"
#import "Ingredients.h"
#import "AddStepsVC.h"
#import "Recipes.h"
@interface AddIngredientsVC ()

@end
NSMutableCharacterSet *CharacterSet;
NSCharacterSet *NumericSetFoo;
@implementation AddIngredientsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.currentNewRecipe = self.someRecipe;
    CharacterSet = [NSMutableCharacterSet uppercaseLetterCharacterSet];
    [CharacterSet formUnionWithCharacterSet:[NSCharacterSet lowercaseLetterCharacterSet]];
    NumericSetFoo = [NSCharacterSet decimalDigitCharacterSet];
    
    //load the tableView
    [self.ingredientsTableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)AddIngredientName
{
    //check if the Entry is a valid entry
    NSString *currentName = self.IngredientTextField.text;
    if ([[currentName stringByTrimmingCharactersInSet:CharacterSet] isEqualToString:@""]) {
        //this string is valid set it to our recipe
        return currentName;
    }
    else
    {
        //post a UIAlert
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Name can only be letters" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [av show];
        currentName = @"";
    }
    return currentName;
}

-(NSInteger)AddIngredientAmount
{
    //check if the Entry is a valid entry
    NSString *currentName = self.amountTextField.text;
    if ([[currentName stringByTrimmingCharactersInSet:NumericSetFoo] isEqualToString:@""]) {
        //this string is valid set it to our recipe
        return [currentName integerValue];
    }
    else
    {
        //post a UIAlert
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Amount can only be a number" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [av show];
        currentName = @"0";
    }
    return [currentName integerValue];
}

-(void)ClearTextFields
{
    self.IngredientTextField.text = @"";
    self.amountTextField.text = @"";
}

#pragma mark -TableView Functions
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddIngredientCell"];
    NSString *ingredientName = [self.currentNewRecipe.arrIngredients[indexPath.row] strName];
    NSInteger ingredientAmount = [self.currentNewRecipe.arrIngredients[indexPath.row] intAmount];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld %@",ingredientAmount,ingredientName];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.currentNewRecipe.arrIngredients count];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]isEqualToString:@"Phase2Complete"]) {
        AddStepsVC *destinationVC = segue.destinationViewController;
        destinationVC.stepsSomeRecipe = self.currentNewRecipe;
    }
}


- (IBAction)AddPress:(UIButton *)sender {
    //add a new Ingredient to our array
    Ingredients *newIngredient = [[Ingredients alloc]initWithName:(NSMutableString*)[self AddIngredientName] withAmount:[self AddIngredientAmount]];

    if ([newIngredient.strName isEqualToString:@""] && newIngredient.intAmount != 0)
    {
        //do not add the Ingredient to the array because there was something wrong with the input
    }
    else
    {
        //add the new ingredient to our array
        [self.currentNewRecipe.arrIngredients addObject:newIngredient];
        
        //clear out the text fields so someone can add another item
        [self ClearTextFields];
        //reload the table
        [self.ingredientsTableView reloadData];
    }
    
}

- (IBAction)RemovePress:(UIButton *)sender {
   NSIndexPath *indexPath =  [self.ingredientsTableView indexPathForSelectedRow];
    
    //check if this is a valid
    if (indexPath != nil) {
        //lets remove an item
        [self.currentNewRecipe.arrIngredients removeObjectAtIndex:indexPath.row];
        //reload the table
        [self.ingredientsTableView reloadData];

    }
}
@end
