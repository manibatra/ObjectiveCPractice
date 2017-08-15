//
//  ViewController.m
//  Test
//
//  Created by Mani Batra on 28/11/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize postParams, facebook;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    if ([PFUser currentUser] &&[PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
//        
//        NSLog(@"You dont have to login again");
//        
//    }
    
   // self.facebook=[[PF_Facebook alloc] initWithAppId:PF_FBSession.activeSession.appID andDelegate:nil];
    
    UIImage *image=[UIImage imageNamed:@"2012-08-23-310.jpg"];
    
    self.postParams=[[NSMutableDictionary alloc] initWithObjectsAndKeys:
                      @"https://developers.facebook.com/ios", @"link",
                     image, @"picture",
                     @"Facebook SDK for iOS", @"name",
                     @"Build great social apps and get more installs.", @"caption",
                     @"The Facebook SDK for iOS makes it easier and faster to develop Facebook integrated iOS apps.", @"description",
                     nil];
    
    SLComposeViewController *tweet=[SLComposeViewController]

    [PF_FBSession.activeSession handleDidBecomeActive];

    
    
}


-(void) publishStory{
    
//    
//    [PF_FBRequestConnection startWithGraphPath:@"me/feed" parameters:self.postParams HTTPMethod:@"POST" completionHandler:^(PF_FBRequestConnection *connection, id result, NSError *error) {
//        
//        NSLog(@"HEre");
//        
//        if (error) {
//            
//            NSLog(@"There was an error: %@", error.description);
//            
//        }else{
//            
//            NSLog(@"We did it");
//            
//        }
//        
//        
//        
//    }];

    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"Facebook SDK for iOS", @"name",
                                   @"131722800251844", @"to",
                                   @"Build great social apps and get more installs.", @"caption",
                                   @"The Facebook SDK for iOS makes it easier and faster to develop Facebook integrated iOS apps.", @"description",
                                   @"https://developers.facebook.com/ios", @"link",
                                   @"http://files.parse.com/3acc0208-bb64-40cb-ad03-e8244606c7e8/8b9da0b3-12dd-4150-b691-89a84faced35-account%20view.png", @"picture",
                                   nil];
    
    // Invoke the dialog
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.facebook = appDelegate.facebook;
    
    
    [self.facebook dialog:@"feed" andParams:params andDelegate:self];
    
    
}

-(void)success:(PFObject*)my error:(NSError*)error{
    
    if (!error) {
        [my addUniqueObjectsFromArray:[NSArray arrayWithObjects:@"Reading", @"Hacking", @"Dancing", @"Watching Movies", nil] forKey:@"Interests"];
        [my saveInBackground];
        
    }else{
        
        NSLog(@"Fucked");
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonAction:(id)sender {
    
    //NSArray *permissions=@[@"publish_stream"];
    
    [PFFacebookUtils logInWithPermissions:nil block:^(PFUser *user, NSError *error) {
        
        if (!user) {
            if (!error) {
                NSLog(@"User cancelled the login");
            }else{
                
                NSLog(@"An error occurred");
                
            }
        }else if (user.isNew){
            
            
            NSLog(@"User signed up and logged in with FB");
            
        }else{
            
            
            NSLog(@"User with fb logged in");
            
        }
        
    }];
    
    
    
    
}

- (IBAction)shareBUttonAction:(id)sender {
//    
//    [PFFacebookUtils reauthorizeUser:[PFUser currentUser]
//                     withPermissions:@[@"publish_stream"]
//                            audience:PF_FBSessionDefaultAudienceFriends
//                               block:^(BOOL succeeded, NSError *error) {
//                                   if (succeeded) {
//                                       // Your app now has publishing permissions for the user
//                                   }
//                               }];
    
    
        
    [self publishStory];
    
    
}
@end
