//
//  SummaryViewController.m
//  TabbedCalculation
//
//  Created by Mani Batra on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SummaryViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController
@synthesize totalCalculations;

-(void) updateTotal{
    
    calcCount++;
    printf("%i",calcCount);
    
}

-(void) viewWillAppear:(BOOL) animated{
    
    NSString *calcResult=[[NSString alloc] initWithFormat:@"%d",calcCount];
    totalCalculations.text=calcResult;
    [calcResult release];
    [super viewWillAppear:animated];
    
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
    
    [totalCalculations release];
    [super dealloc];
    
    
}

@end
