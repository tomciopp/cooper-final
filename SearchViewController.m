//
//  SearchViewController.m
//  freightify
//
//  Created by Thomas Cioppettini on 12/8/12.
//  Copyright (c) 2012 Thomas Cioppettini. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchResultsViewController.h"
#import "FSWebRequest.h"

@interface SearchViewController ()

@end

@implementation SearchViewController
@synthesize searchOptionsPicker;
@synthesize milesList;
@synthesize truckTypeList;
@synthesize miles;
@synthesize truckType;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    searchOptionsPicker.showsSelectionIndicator = TRUE;
    self.milesList = [[NSArray alloc] initWithObjects:@"10", @"25", @"50", @"100", @"150", @"200", nil];
    self.truckTypeList = [[NSArray alloc] initWithObjects:@"53' Dry van", @"Refrigerated" @"40' Dry Van", @"Other", nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setSearchOptionsPicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch(component ) {
        case 0:
            return [truckTypeList count];
            break;
        case 1:
            return [milesList count];
            break;
        default:
            return [truckTypeList count];
            break;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
  if (component == 0) {
    self.truckType = [truckTypeList objectAtIndex:row];
    return;
  } else{
    self.miles = [milesList objectAtIndex:row];
    return;
  }
}


-(void)search: (NSString *)query withMiles: (NSString *)in_miles andTruck:(NSString *)truck {
    FSWebRequest *request = [[FSWebRequest alloc] init];
    NSArray *searchResults = [request searchResults:query withMiles: in_miles andTruck: truck];
    SearchResultsViewController *searchResultsViewController = [[SearchResultsViewController alloc]
                                                                init];
    searchResultsViewController.searchResults = searchResults;
    [self presentViewController:searchResultsViewController animated: YES completion:nil];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
  if (component == 0) {
    return [truckTypeList objectAtIndex:row];
  } else {
    return [milesList objectAtIndex:row];
  }
}

-(IBAction)searchButtonPressed:(id)sender{
    NSString *query = searchTextField.text;
    
    [self search: query withMiles: self.miles andTruck: self.truckType];
}



@end
