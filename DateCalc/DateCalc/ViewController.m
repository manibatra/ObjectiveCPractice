//
//  ViewController.m
//  DateCalc
//
//  Created by Mani Batra on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize differenceResult;


-(IBAction)showDate:(id)sender{
    
    NSDate *todaysDate;
    NSString *differenceOutput;
    NSTimeInterval difference;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSString *todaysdateString;
    
    
    todaysDate=[[NSDate alloc] init];
    difference=[todaysDate timeIntervalSinceDate:[sender date]]/86400;
    
    [dateFormat setDateFormat:@"MMMM d, yyyy hh:mm:ssa"];
    todaysdateString=[dateFormat stringFromDate:todaysDate];
    differenceOutput=[[NSString alloc] initWithFormat:@"Difference between the choosen date and today (%@) in days : %1.2f",todaysdateString,fabs(difference)];
    differenceResult.text=differenceOutput;
    
    [todaysDate release];
    [dateFormat release];
    [differenceOutput release];
    
    
}



- (void)viewDidLoad
{
    NSDate *today=[[NSDate alloc] initWithTimeIntervalSinceNow:10000000000];
    [date setDate:today animated:YES];
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
    
    [differenceResult release];
    [super dealloc];
    
}

@end
