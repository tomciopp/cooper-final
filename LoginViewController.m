//
//  LoginViewController.m
//  freightify
//
//  Created by Thomas Cioppettini on 12/16/12.
//  Copyright (c) 2012 Thomas Cioppettini. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logUserIn:(id)sender {
    SearchViewController *viewController = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    
    if ([userUsernameField.text isEqualToString:@""] && [[APIClient sharedClient] isAuthenticated]) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else {
        NSLog(@"== Exchanging username and password for OAuth credentials");
        [[APIClient sharedClient] authenticateUsingOAuthWithEmail:userEmailField.text password:userPasswordField.text success:^(AFOAuthAccount *account) {
            NSLog(@"  == Successfully received OAuth credentials %@", account);
            [self.navigationController pushViewController:viewController animated:YES];
        } failure:^(NSError *error) {
        }];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
