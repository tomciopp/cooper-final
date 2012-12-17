//
//  LoginViewController.h
//  freightify
//
//  Created by Thomas Cioppettini on 12/16/12.
//  Copyright (c) 2012 Thomas Cioppettini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"

@interface LoginViewViewController : UIViewController
{
    NSString *access_token;
    IBOutlet UITextField *userPasswordField;
    IBOutlet UITextField *userEmailField;
}

- (IBAction)logUserIn:(id)sender;
@end
