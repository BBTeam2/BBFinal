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

//URL definition
#define weatherJSON @"http://api.openweathermap.org/data/2.5/weather?units=imperial&appid=2de143494c0b295cca9337e1e96b00e0"

#define globalQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)

@interface SuggestedRecipeVC ()

@end

@implementation SuggestedRecipeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //make sure singleton is set up
    // setup the locationManager
    [self locationManagerSetup];
    //we want to grab the current lat and long from the URL
    [self LoadURL];
    recipeSingleton = [AllRecipeSingleton objectManager];
    self.arrSuggestRecipe = [[NSMutableArray alloc]init];
    [self LoadRecipeArray];
    [self.suggestedReceipeTableView reloadData];
    //have singleton hold the information for the 3rdTab Navigation Controller
    recipeSingleton.ThirdTabNavController = self.navigationController;
    
}
-(void)viewDidAppear:(BOOL)animated
{
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
#pragma mark Core Location Functions
-(void)locationManagerSetup{
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager requestAlwaysAuthorization];
    [locationManager startMonitoringSignificantLocationChanges];
    [locationManager startUpdatingLocation];
}

-(void)LoadURL
{
    dispatch_async(globalQueue, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
        
        NSURL *url = [NSURL URLWithString:weatherJSON];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        [request setHTTPMethod:@"GET"];
        
        NSURLSessionDataTask *getTask = [session dataTaskWithRequest:request completionHandler:^(NSData*  _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
        }];
        
        [getTask resume];
        
    });
}

//Obtains latitude and longitude of current position if 'locationManagerSetup'
//successfully completes.
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", locations);
    CLLocation *currentLoc = [locations lastObject];
    
    //LATITUDE AND LONGITUDE FOR CURRENT LOCATION
    //RECORDED HERE.
    lat = currentLoc.coordinate.latitude;
    lng = currentLoc.coordinate.longitude;
    
    //place latitude and longitude values to string and concatenate it to OpenWeatherMap URL.
    NSString *coord = [NSString stringWithFormat:@"%@&lat=%d&lon=%d", weatherJSON, lat, lng];
    NSURL *webCall = [NSURL URLWithString:coord];
    
    //change URL to type NSData and send to dataRetrieve method.
    NSData *data = [NSData dataWithContentsOfURL:webCall];
    
    [self dataRetrieved:data];
    
}

//Returns error message if 'locationManagerSetup' fails.
-(void)locationManager:(CLLocationManager*)manager didFailWithError:(NSError*)error{
    
    NSLog(@"Error: %@",error);
}

//Reads JSON URL defined after imported header files.  Method also obtains current
//temperature of location from retrieved latitude and longitude.
-(void)dataRetrieved:(NSData*)data{
    NSError *error;
    
    //place JSON data from NSData (which contains the URL) into a dictionary.
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    //store the temperature value ('called temp') and its dictionary ('called main')in from the URL dictionary variable.
    NSDictionary *mainDict = [jsonDict objectForKey:@"main"];
    NSString *temperature = [mainDict valueForKey:@"temp"];
    
    //display temperature value for validity.
    self.intCurrentTemp = [temperature integerValue];
}


//Once we have our array stored we will need to arrange or restructure the array based on the current
//temperature
-(void)ArrangeByTemperature
{
    //grab the temperature
    //set a string to a category based on the temperature
    //loop thru array and set the current recipe to the new array we will be using.
    NSMutableString* currentCategory = [[NSMutableString alloc]init];
    
    if (self.intCurrentTemp <= 60) {
        currentCategory = (NSMutableString*)@"Cold";
    }
    if (self.intCurrentTemp >=61 && self.intCurrentTemp <= 79 ) {
        currentCategory = (NSMutableString*)@"Moderate";
    }
    if (self.intCurrentTemp >= 80) {
        currentCategory = (NSMutableString*)@"Tropical";
    }
    
    for (int i = 0; i < [recipeSingleton.AllMyRecipeTab count]; i++) {
        if([[recipeSingleton.AllMyRecipeTab[i] strCategory]isEqualToString:currentCategory])
        {
            [self.arrSuggestRecipe addObject:recipeSingleton.AllMyRecipeTab[i]];
        }
    }
    
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
    [cell.viewButton addTarget:self action:@selector(LetsPush:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrSuggestRecipe.count;
}

-(void)LetsPush:(UIButton*)sender
{
    //lets check if other tab is currently in the way
    UINavigationController *otherTabNav = recipeSingleton.FirstTabNavController;
    if (otherTabNav != nil) {
        [otherTabNav popToRootViewControllerAnimated:YES];
    }
    [self performSegueWithIdentifier:@"Tab3ToCurrent" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //this is the specific Recipe we are passing to the next view
    
    if ([[segue identifier] isEqualToString:@"Tab3ToCurrent"]) {
        NSInteger index = [(UIButton*)sender tag];
        Recipes* CurrentRecipe = self.arrSuggestRecipe[index];
        CurrentSelectedVC *destinationVC =  segue.destinationViewController;
        destinationVC.currentRecipe = CurrentRecipe;
        //play some sweet sounds
        [recipeSingleton.cookingSound playSound];
        
    }
    
}


@end
