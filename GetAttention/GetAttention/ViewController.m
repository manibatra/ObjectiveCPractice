//
//  ViewController.m
//  GetAttention
//
//  Created by Mani Batra on 10/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
//#import <AudioToolbox/AudioToolbox.h>


@interface ViewController ()

@end

@implementation ViewController
@synthesize userOutput;
@synthesize userInput;
@synthesize player;

-(IBAction)doAlert:(id)sender{
    
    UIAlertView *alertDialog;
    UILocalNotification *scheduledAlert;
    
    alertDialog=[[UIAlertView alloc] initWithTitle:@"Alert Button Selected" message:@"I need your attention NOW" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertDialog show];
    [alertDialog release];
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    scheduledAlert=[[[UILocalNotification alloc] init] autorelease];
    scheduledAlert.applicationIconBadgeNumber=10;
    scheduledAlert.fireDate=[NSDate dateWithTimeIntervalSinceNow: 2];
    scheduledAlert.timeZone=[NSTimeZone defaultTimeZone];
    scheduledAlert.repeatInterval=NSDayCalendarUnit;
    scheduledAlert.soundName=@"soundeffect.wav";
    scheduledAlert.alertBody=@"I'd like to get your attention again!";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:scheduledAlert];
    
}
-(IBAction)doMultiButtonAlert:(id)sender{
    
    UIAlertView *alertDialog;
    alertDialog=[[UIAlertView alloc] initWithTitle:@"Alert Button Selected" message:@"I need your attention NOW" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Maybe Later",@"Never", nil];
    [alertDialog show];
    [alertDialog release];
    
}
-(IBAction)doAlertInput:(id)sender{
    
    UIAlertView *alertDialog;
    alertDialog=[[UIAlertView alloc] initWithTitle:@"Please Enter Your Email Address" message:@"You wont see me" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    userInput=[[UITextField alloc] initWithFrame:CGRectMake(12.0, 70.0, 260.0, 25.0)];
    [userInput setBackgroundColor:[UIColor whiteColor]];
    [alertDialog addSubview:userInput];
    [alertDialog show];
    [alertDialog release];
    
}
-(IBAction)doAlertSound:(id)sender{
    
    NSString *soundFilePath =
    [[NSBundle mainBundle] pathForResource: @"soundeffect"
                                    ofType: @"wav"];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    AVAudioPlayer *newPlayer =
    [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL
                                           error: nil];
    [fileURL release];
    
    self.player = newPlayer;
    [newPlayer release];
    
    [player play];
    [player setDelegate: self];
    
    
}
-(IBAction)doSound:(id)sender{
    
    NSString *soundFilePath =
    [[NSBundle mainBundle] pathForResource: @"alertsound"
                                    ofType: @"wav"];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    AVAudioPlayer *newPlayer =
    [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error:nil];
    [fileURL release];
    
    self.player = newPlayer;
    [newPlayer release];
    
    [player play];
    [player setDelegate: self];
    [player release];
}
-(IBAction)doActionSheet:(id)sender{
    
    UIActionSheet *actionSheet;
    actionSheet=[[UIActionSheet alloc] initWithTitle:@"Available Selections" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Destroy" otherButtonTitles:@"Negotiate",@"Compromise", nil];
    [actionSheet showInView:self.view];
    //actionSheet.actionSheetStyle=UIBarStyleDefault;
    [actionSheet release];
    
}
-(IBAction)doVibration:(id)sender{
    
//#import <AudioToolbox/AudioToolbox.h>
    
}

-(void) alertView:(UIAlertView*) alertView clickedButtonAtIndex:(NSInteger) buttonIndex{
    
    NSString *buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Maybe Later"]) {
        userOutput.text=@"Clicked Maybe Later";
            } else if([buttonTitle isEqualToString:@"Never"]) {
                userOutput.text=@"Clicked Never";
            } else {
                userOutput.text=@"Clicked Ok";
            }
    
    if ([alertView.title isEqualToString:@"Please Enter Your Email Address"]) {
        userOutput.text=userInput.text;
    }
    
    
}

-(void) actionSheet:(UIActionSheet*) actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSString *buttonTitle=[actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Destroy"]) {
        userOutput.text=@"Clicked Destroy";
            } else if([buttonTitle isEqualToString:@"Negotiate"]) {
                userOutput.text=@"Clicked Negotiate";
            } else if ([buttonTitle isEqualToString:@"Compromise"]) {
                userOutput.text=@"Clicked Compromise";
            }else {
                userOutput.text=@"Clicked Cancel";
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
    
    [userOutput release];
    [userInput release];
    [super dealloc];
    
}

@end
