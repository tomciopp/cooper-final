//
//  FSWebRequest.m
//  freightify
//
//  Created by Thomas Cioppettini on 12/8/12.
//  Copyright (c) 2012 Thomas Cioppettini. All rights reserved.
//

#import "FSWebRequest.h"

@implementation FSWebRequest
-(NSArray *)searchResults: (NSString *)query
                withMiles:(NSString *)miles
                 andTruck:(NSString *)truck{
    NSString *call = [NSString stringWithFormat:@"http://www.freightify.com/search?query=%@&truck_type=%@&miles=%@", query, truck, miles];
    NSURL *url = [NSURL URLWithString:call];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil
                                                         error:nil];
    [self parseJSON: jsonData];
    return results;
    
}

-(void)parseJSON: (NSData *)jsonData {
    NSError *error;
    results = [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingMutableLeaves error: &error];
}

@end
