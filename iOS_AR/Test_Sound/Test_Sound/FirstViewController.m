//
//  FirstViewController.m
//  Test_Sound
//
//  Created by Mani Batra on 23/10/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    
    PFObject *testObject = [PFObject objectWithClassName:@"Birthday"];
    [testObject setObject:@"Mani" forKey:@"name"];
    [testObject save];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)systemSoundAction{
    
    NSString *soundFilePath=[[NSBundle mainBundle] pathForResource:@"alertsound" ofType:@"wav"];
    NSURL *soundFileURL=[NSURL fileURLWithPath:soundFilePath];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundFileURL), &_systemSound);
    AudioServicesPlaySystemSound(_systemSound);
    
}

-(void)avAudioPlayerAction{
    
    NSError *setCategoryError=nil;
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:&setCategoryError];
    
    NSString *backgroundMusicPath=[[NSBundle mainBundle] pathForResource:@"two_of_us" ofType:@"mp3"];
    NSURL *backgroundMusicURL=[NSURL fileURLWithPath:backgroundMusicPath];
    
    NSError *error;
    
    _avAudioPlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
    
    [_avAudioPlayer play];
    
}

@end
