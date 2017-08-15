//
//  ViewController.m
//  FlowerWeb
//
//  Created by Mani Batra on 10/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize colorChoice;
@synthesize flowerView;
@synthesize flowerDetailView;

-(IBAction)toggleFlowerdetail:(id)sender{
    
    flowerDetailView.hidden=![sender isOn];
    
}


-(IBAction)getFlower:(id)sender{
    
    NSURL *imageURL;
    NSURL *detailURL;
    NSString *imageURLString;
    NSString *detailURLString;
    NSString *color;
    int sessionId;
    
    
    color=[colorChoice titleForSegmentAtIndex:[colorChoice selectedSegmentIndex]];
    sessionId=random()%1000;
    
    imageURLString=[[NSString alloc] initWithFormat:@"http://www.floraphotographs.com/showrandomiphone.php?color=%@&session=%d",color, sessionId];
    detailURLString=[[NSString alloc] initWithFormat:@"http://www.floraphotographs.com/detailiphone.php?session=%d",sessionId];
    
    imageURL=[[NSURL alloc] initWithString:imageURLString];
    detailURL=[[NSURL alloc] initWithString:detailURLString];
    
    [flowerView loadRequest:[NSURLRequest requestWithURL:imageURL]];
    [flowerDetailView loadRequest:[NSURLRequest requestWithURL:detailURL]];
    
    flowerDetailView.backgroundColor=[UIColor clearColor];
    
    [imageURL release];
    [detailURL release];
    [imageURLString release];
    [detailURLString release];
                     
    
}



- (void)viewDidLoad
{
    flowerDetailView.hidden=YES;
    [self getFlower:nil];
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
    
    [flowerDetailView release];
    [flowerView release];
    [colorChoice release];
    [super dealloc];
    
}

@end
