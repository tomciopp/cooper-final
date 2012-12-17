//
//  FSWebRequest.h
//  freightify
//
//  Created by Thomas Cioppettini on 12/8/12.
//  Copyright (c) 2012 Thomas Cioppettini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSWebRequest : NSObject
{
    NSArray *results;
}
-(NSArray *)searchResults: (NSString *)query
                withMiles: (NSString *)miles
                 andTruck:(NSString *) truck;
@end
