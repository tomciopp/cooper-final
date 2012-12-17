//
//  APIClient.h
//  freightify
//
//  Created by Thomas Cioppettini on 12/16/12.
//  Copyright (c) 2012 Thomas Cioppettini. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPClient.h"
#import "AFOAuth2Client.h"

@interface APIClient : AFHTTPClient

@property (nonatomic, assign) BOOL isAuthenticated;

+ (APIClient *) sharedClient;

- (void)setAuthorizationWithToken:(NSString *)accessToken refreshToken:(NSString *)refreshToken;

- (void)authenticateUsingOAuthWithEmail:(NSString *)email
                                  password:(NSString *)password
                                   success:(void (^)(AFOAuthAccount *account))success
                                   failure:(void (^)(NSError *error))failure;

#define oClientBaseURLString @"http://localhost:3000/"
#define oClientID            @"3988b3c8469081fcfb5e163ed8c70cc2"
#define oClientSecret        @"8e993109c788325307898ca5b48548bb"

@end
