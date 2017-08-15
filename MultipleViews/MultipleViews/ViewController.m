//
//  ViewController.m
//  MultipleViews
//
//  Created by Mani Batra on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize firstViewController;
@synthesize secondViewController;
@synthesize thirdViewController;

-(IBAction)loadFirstView:(id)sender{
    [self clearView];
    [self.view insertSubview:firstViewController.view atIndex:0];
    
}
-(IBAction)loadSecondView:(id)sender{
    [self clearView];

    [self.view insertSubview: secondViewController.view atIndex:0];
    
}
-(IBAction)loadThirdView:(id)sender{
    [self clearView];

    [self.view insertSubview : thirdViewController.view atIndex:0];
    
}


-(void) clearView{
    
    if (firstViewController.view.superview) {
        [firstViewController.view removeFromSuperview];
            } else if (secondViewController.view.superview){
                [secondViewController.view removeFromSuperview];
            } else {
                [thirdViewController.view removeFromSuperview];

            }
    
    
}



- (void)viewDidLoad
{
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
    
    [firstViewController release];
    [secondViewController release];
    [thirdViewController release];
    [super dealloc];
    
}

@end
