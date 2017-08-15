//
//  ViewController.m
//  ReturnMe
//
//  Created by Mani Batra on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize phone;
@synthesize picture;
@synthesize name;
@synthesize email;

-(NSDictionary*) initialDefaults{
    
    NSArray *keys=[[[NSArray alloc] initWithObjects:kPicture, kName, kEmail, kPhone, nil] autorelease];
    NSArray *values=[[[NSArray alloc] initWithObjects:@"Dog", @"Mani Batra", @"manibatra2002@gmail.com", @"8600042610", nil] autorelease];
    return [[[NSDictionary alloc] initWithObjects:values forKeys:keys] autorelease];
    
}

-(void) setvalueFromPreferences{
    
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults registerDefaults:[self initialDefaults]];
    NSString *picturePreference=[userDefaults stringForKey:kPicture];
    NSLog(@"%@",picturePreference);
    if ([picturePreference isEqualToString:@"Dog"]) {
        picture.image=[UIImage imageNamed:@"dog1.png"];
        
    } else if ([picturePreference isEqualToString:@"Mean Dog"]) {
        picture.image=[UIImage imageNamed:@"dog2.png"];
        
    }else {
        picture.image=[UIImage imageNamed:@"coral.png"];

    }
    
    name.text=[userDefaults stringForKey:kName];
    phone.text=[userDefaults stringForKey:kPhone];
    email.text=[userDefaults stringForKey:kEmail];
    
}
- (void)viewDidLoad
{
    [self setvalueFromPreferences];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void) dealloc{
    [phone release];
    [picture release];
    [name release];
    [email release];
    [super dealloc];
    
}

@end
