//
//  SearchResultsViewController.h
//  freightify
//
//  Created by Thomas Cioppettini on 12/8/12.
//  Copyright (c) 2012 Thomas Cioppettini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultsViewController : UIViewController < UITableViewDelegate, UITableViewDataSource >

{
    NSArray *searchResults;
    IBOutlet UITableView *searchResultsTable;
}

@property NSArray *searchResults;

@end
