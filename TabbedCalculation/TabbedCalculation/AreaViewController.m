//
//  AreaViewController.m
//  TabbedCalculation
//
//  Created by Mani Batra on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#define Pi 3.1415926

#import "AreaViewController.h"

@interface AreaViewController ()

@end

@implementation AreaViewController
@synthesize rectWidth;
@synthesize rectResult;
@synthesize rectLength;
@synthesize circleResult;
@synthesize circleRadius;

-(IBAction)calculate:(id)sender{
    
    float floatRectangleResult=[rectLength.text floatValue]*[rectWidth.text floatValue];
    float floatCircleResult=[circleRadius.text floatValue]*[circleRadius.text floatValue]*Pi;
    NSString *stringRecResult=[[NSString alloc] initWithFormat:@"%1.2f",floatRectangleResult];
    NSString *stringCircleResult=[[NSString alloc] initWithFormat:@"%1.2f",floatCircleResult];
    rectResult.text=stringRecResult;
    circleResult.text=stringCircleResult;
    [stringRecResult release];
    [stringCircleResult release];
    
    [summaryViewController updateTotal];

}
-(IBAction)hideKeyboard:(id)sender{
    
    [rectLength resignFirstResponder];
    [rectWidth resignFirstResponder];
    [circleRadius resignFirstResponder];
    
}


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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) dealloc{
    
    [rectLength release];
    [rectWidth release];
    [circleRadius release];
    [rectResult release];
    [circleResult release];
    [super dealloc];
    
    
}

@end
