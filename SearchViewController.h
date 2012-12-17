//
//  SearchViewController.h
//  freightify
//
//  Created by Thomas Cioppettini on 12/8/12.
//  Copyright (c) 2012 Thomas Cioppettini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
{
    IBOutlet UITextField *searchTextField;
}
@property (strong, nonatomic) NSString *miles;
@property (strong, nonatomic) NSString *truckType;
@property (strong, nonatomic) IBOutlet UIPickerView *searchOptionsPicker;
@property (strong, nonatomic) NSArray *truckTypeList;
@property (strong, nonatomic) NSArray *milesList;

- (IBAction)searchButtonPressed:(id)sender;
@end
