//
//  CompleteVC.m
//  CookingAppDgn
//
//  Created by MAC1 on 1/9/16.
//  Copyright © 2016 unlimited. All rights reserved.
//

#import "CompleteVC.h"
#import "Recipes.h"
#import "CookingSteps.h"
@interface CompleteVC ()

@end

@implementation CompleteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //set the uiimage to the one we will see viable
    self.imageView.image = self.someImage;
    self.navigationController.navigationBar.hidden = YES;
    self.finalRecipe = self.thisRecipe;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)postFacebook:(UIButton *)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        slCVC = [[SLComposeViewController alloc]init];
        slCVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        NSString *nameString = self.someName;
        [slCVC setInitialText:[ NSString stringWithFormat:@"I have just created %@ using My Inner Chef", nameString]];
        [self presentViewController:slCVC animated:YES completion:nil];
    }
    else
    {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"Facebook type is not available" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [av show];
    }
}

- (IBAction)postTwitter:(UIButton *)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        slCVC = [[SLComposeViewController alloc]init];
        slCVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        NSString *nameString = self.someName;
        [slCVC setInitialText:[ NSString stringWithFormat:@"I have just created %@ using My Inner Chef", nameString]];
        [self presentViewController:slCVC animated:YES completion:nil];
    }
    else
    {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"Twitter type is not available" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [av show];
    }
}

- (IBAction)NoThanksPress:(UIButton *)sender {
    //check all the steps and reset there complete variable
    for (int i = 0; i < [self.finalRecipe.arrSteps count]; i++) {
        [self.finalRecipe.arrSteps[i] setIsComplete:NO ];
    }
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
