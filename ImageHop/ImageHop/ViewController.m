//
//  ViewController.m
//  ImageHop
//
//  Created by Mani Batra on 09/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize toggleButton;
@synthesize imageView;
@synthesize hopesPerSecond;
@synthesize animationSpeed;
@synthesize manual;

-(IBAction)hideKeyboard:(id)sender{
    
    [toggleButton resignFirstResponder];
    [imageView resignFirstResponder];
    [hopesPerSecond resignFirstResponder];
    [animationSpeed resignFirstResponder];
    [manual resignFirstResponder];
    
}


-(IBAction)toggleAnimation:(id)sender{
    

    NSLog(@"%@",manual.placeholder);

    

    
    
    if (imageView.isAnimating) {
        [imageView stopAnimating];
        [manual setUserInteractionEnabled:YES];

        [toggleButton setTitle:@"Hop!" forState:UIControlStateNormal];
                        
            } else {
                
                                //Reading number from the text box
                NSNumberFormatter *f=[[NSNumberFormatter alloc] init];
                if ([[manual text] isEqualToString:@""]) {
                    
                    animationSpeed.value=[[f numberFromString:manual.placeholder] floatValue];
                

                        } else {
                            animationSpeed.value=[[f numberFromString:manual.text] floatValue];

                                }
                
                
                imageView.animationDuration=2-animationSpeed.value;
           
                //Clearing the text first so that the plceholder can be set
                manual.text=@"";
                manual.placeholder=[[NSString alloc] initWithFormat:@"%1.2f",animationSpeed.value];
                
                
                hopesPerSecond.text=[[NSString alloc] initWithFormat:@"%1.2f hps",1/(2-animationSpeed.value)];
                

                imageView.animationDuration=2-animationSpeed.value;

                [imageView startAnimating];
                [manual setUserInteractionEnabled:NO];

                [toggleButton setTitle:@"Sit Still!" forState:UIControlStateNormal];
                [f release];
                    }
    
    
}

-(IBAction)setSpeed:(id)sender{
    
    NSString *hopRateString;
    imageView.animationDuration=2-animationSpeed.value;
    manual.text=@"";
    manual.placeholder=[[NSString alloc] initWithFormat:@"%1.2f",animationSpeed.value];
    [imageView startAnimating];
    [toggleButton setTitle:@"Sit Still!" forState:UIControlStateNormal];
    hopRateString=[[NSString alloc] initWithFormat:@"%1.2f hps",1/(2-animationSpeed.value)];
    hopesPerSecond.text=hopRateString;
    [hopRateString release];
    
}



- (void)viewDidLoad
{
    
    NSArray *hopAnimation;
    hopAnimation=[[NSArray alloc] initWithObjects:
                  [UIImage imageNamed:@"frame-1.png"],
                  [UIImage imageNamed:@"frame-2.png"],
                  [UIImage imageNamed:@"frame-3.png"],
                  [UIImage imageNamed:@"frame-4.png"],
                  [UIImage imageNamed:@"frame-5.png"],
                  [UIImage imageNamed:@"frame-6.png"],
                  [UIImage imageNamed:@"frame-7.png"],
                  [UIImage imageNamed:@"frame-8.png"],
                  [UIImage imageNamed:@"frame-9.png"],
                  [UIImage imageNamed:@"frame-10.png"],
                  [UIImage imageNamed:@"frame-11.png"],
                  [UIImage imageNamed:@"frame-12.png"],
                  [UIImage imageNamed:@"frame-13.png"],
                  [UIImage imageNamed:@"frame-14.png"],
                  [UIImage imageNamed:@"frame-15.png"],
                  [UIImage imageNamed:@"frame-16.png"],
                  [UIImage imageNamed:@"frame-17.png"],
                  [UIImage imageNamed:@"frame-18.png"],
                  [UIImage imageNamed:@"frame-19.png"],
                  [UIImage imageNamed:@"frame-20.png"],nil];
    imageView.animationImages=hopAnimation;
    imageView.animationDuration=1;
    [hopAnimation release];
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
    
    [toggleButton release];
    [animationSpeed release];
    [hopesPerSecond release];
    [imageView release];
    [super dealloc];
    
}

@end
