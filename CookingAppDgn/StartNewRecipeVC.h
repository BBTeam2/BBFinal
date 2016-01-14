//
//  StartNewReceipeVC.h
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllRecipeSingleton.h"
@class Recipes;
@interface StartNewRecipeVC : UIViewController<UITextFieldDelegate,UITextViewDelegate>
{
    AllRecipeSingleton *recipeSingleton;
}
//properties
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutlet UITextField *servingSizeTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *categorySegmentCntrl;
@property (strong, nonatomic) Recipes *tempRecipe;

//methods
-(BOOL)AddTitle;

-(BOOL)AddDescription;

-(BOOL)AddServingSize;

-(BOOL)AddCategory;

@end
