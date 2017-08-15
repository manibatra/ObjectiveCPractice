//
//  ViewController.m
//  FieldButtonFun
//
//  Created by Mani Batra on 09/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize thePlace;
@synthesize theVerb;
@synthesize theNumber;
@synthesize theTemplate;
@synthesize theStory;
@synthesize generateStory;

-(IBAction)hideKeyboard:(id)sender{
    [thePlace resignFirstResponder];
    [theVerb resignFirstResponder];
    [theNumber resignFirstResponder];
    [theTemplate resignFirstResponder];
    
}

-(IBAction)createStory:(id)sender{
    
    theStory.text=[theTemplate.text stringByReplacingOccurrencesOfString:@"<place>" withString: thePlace.text];
    
    theStory.text=[theStory.text stringByReplacingOccurrencesOfString:@"<verb>" withString: theVerb.text];
    
    
    theStory.text=[theStory.text stringByReplacingOccurrencesOfString:@"<number>" withString: theNumber.text];
    
    
    
}


- (void)viewDidLoad
{
    UIImage *normalImage=[[UIImage imageNamed:@"whiteButton.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
    [generateStory setBackgroundImage:normalImage forState:UIControlStateNormal];
    UIImage *pressedimage=[[UIImage imageNamed:@"blueButton.png"] stretchableImageWithLeftCapWidth:12.0 topCapHeight: 0.0];
    [generateStory  setBackgroundImage:pressedimage forState:UIControlStateHighlighted];
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
    
    [theNumber release];
    [thePlace release];
    [theStory release];
    [theTemplate release];
    [theVerb release];
    [super dealloc];
}

@end
