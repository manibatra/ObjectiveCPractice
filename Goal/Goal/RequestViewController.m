//
//  RequestViewController.m
//  Goal
//
//  Created by Mani Batra on 26/02/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "RequestViewController.h"

@interface RequestViewController ()

@end

@implementation RequestViewController
@synthesize authButton;
@synthesize friendPickerController=_friendPickerController;

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sessionStateChanged:) name:FBSessionStateChangedNotification object:nil];
    
    AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
    [appDelegate openSessionWithAllowLoginUI:NO];
    //[appDelegate checkIncomingNotification];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)authButtonAction:(id)sender {
    
    
        
           AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        // The user has initiated a login, so call the openSession method
        // and show the login UX if necessary.
    if([FBSession.activeSession isOpen]){
        
        
        [appDelegate closeSession];
        
    }else{
        
        ACAccountStore *accountStore;
        ACAccountType *accountTypeFB;
        if ((accountStore = [[ACAccountStore alloc] init]) &&
            (accountTypeFB = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook] ) ){
            
            NSArray *fbAccounts = [accountStore accountsWithAccountType:accountTypeFB];
            id account;
            if (fbAccounts && [fbAccounts count] > 0 &&
                (account = [fbAccounts objectAtIndex:0])){
                
                [accountStore renewCredentialsForAccount:account completion:^(ACAccountCredentialRenewResult renewResult, NSError *error) {
                    //we don't actually need to inspect renewResult or error.
                    if (error){
                        
                    }
                }];
            }
        }

        
        [appDelegate openSessionWithAllowLoginUI:YES];
        
    }

}

- (void)sessionStateChanged:(NSNotification*)notification {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

    if (FBSession.activeSession.isOpen) {
        [self.authButton setTitle:@"Logout" forState:UIControlStateNormal];
        [appDelegate checkIncomingNotification];

    } else {
        [self.authButton setTitle:@"Login" forState:UIControlStateNormal];
    }
}


- (IBAction)newRequest:(id)sender {
    
    if (!self.friendPickerController) {
        self.friendPickerController=[[FBFriendPickerViewController alloc] initWithNibName:nil bundle:nil];
        self.friendPickerController.title=@"Select a Friend";
        self.friendPickerController.delegate=self;
        self.friendPickerController.fieldsForRequest=[NSSet setWithObjects: @"installed", nil];
        
        
    }
        [self.friendPickerController loadData];

        [self presentViewController:self.friendPickerController animated:true completion:nil];

        
    

}

- (void)facebookViewControllerCancelWasPressed:(id)sender
{
    NSLog(@"Friend selection cancelled.");
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)facebookViewControllerDoneWasPressed:(id)sender
{
    AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
    FBFriendPickerViewController *fpc = (FBFriendPickerViewController *)sender;
    for (id<FBGraphUser> user in fpc.selection) {
        
        [appDelegate sendRequest:user];

        NSLog(@"Friend selected: %@", user.name);
    }
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (BOOL)friendPickerViewController:(FBFriendPickerViewController *)friendPicker
                 shouldIncludeUser:(id<FBGraphUser>)user
{
    
    
    BOOL installed = [user objectForKey:@"installed"] != nil;
    return installed;
//    NSArray *deviceData = user.devices;
//    // Loop through list of devices
//    for (NSDictionary *deviceObject in deviceData) {
//        // Check if there is a device match
//        if ([@"iOS" isEqualToString:
//             [deviceObject objectForKey:@"os"]]) {
//            // Friend is an iOS user, include them in the display
//            return YES;
//        }
//    }
//    // Friend is not an iOS user, do not include them
//    return NO;
}
@end
