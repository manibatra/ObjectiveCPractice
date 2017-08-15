//
//  CreateCardViewControllerViewController.m
//  FlashCards
//
//  Created by Mani Batra on 17/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateCardViewControllerViewController.h"

@interface CreateCardViewControllerViewController ()

@end

@implementation CreateCardViewControllerViewController
@synthesize cardDelegate, question, answer;

-(IBAction)save{
    
    [self.cardDelegate didCreateCardWithQuestion:question.text answer:answer.text];
    
}

-(IBAction)cancel{
    
    [self.cardDelegate didcancelCardCreation];
    
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
    
    [question release];
    [answer release];
    [super dealloc];
    
}

@end
