//
//  APIClient.m
//  freightify
//
//  Created by Thomas Cioppettini on 12/16/12.
//  Copyright (c) 2012 Thomas Cioppettini. All rights reserved.
//

#import "APIClient.h"
#import "AFJSONRequestOperation.h"

@implementation APIClient

@synthesize isAuthenticated = _isAuthenticated;

+ (APIClient *) sharedClient{
    
    static APIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:oClientBaseURLString]];
    });
    return _sharedClient;
}


- (void)authenticateUsingOAuthWithEmail:(NSString *)email
                                  password:(NSString *)password
                                   success:(void (^)(AFOAuthAccount *account))success
                                   failure:(void (^)(NSError *error))failure {
    
    NSURL *url = [NSURL URLWithString:oClientBaseURLString];
    AFOAuth2Client *OAuthClient = [[AFOAuth2Client alloc] initWithBaseURL:url];
    
    [OAuthClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [OAuthClient authenticateUsingOAuthWithPath:@"oauth/token.json" username:email  password:password clientID:oClientID secret:oClientSecret success:^(AFOAuthAccount *account) {
        [self setAuthorizationWithToken:account.credential.accessToken refreshToken:account.credential.refreshToken];
        success(account);
    } failure:^(NSError *error) {
        failure(nil);
    }];
}

- (void)setAuthorizationWithToken:(NSString *)accessToken refreshToken:(NSString *)refreshToken{
    
    if (![accessToken isEqualToString:@""]) {
        self.isAuthenticated = YES;
        [[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:@"kaccessToken"];
        [[NSUserDefaults standardUserDefaults] setObject:refreshToken forKey:@"krefreshToken"];
        [self setAuthorizationHeaderWithToken:accessToken];
    }
}


- (id)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"kaccessToken"];
    NSString *refreshToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"krefreshToken"];
    
    [self setAuthorizationWithToken:accessToken refreshToken:refreshToken];
    
    return self;
}

@end
