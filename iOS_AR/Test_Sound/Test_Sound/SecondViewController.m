//
//  SecondViewController.m
//  Test_Sound
//
//  Created by Mani Batra on 23/10/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startRecorder {
    
    NSString *filePath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/recording.mp3"];
    NSDictionary *recordSettings=[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithFloat:44100.0], AVSampleRateKey, [NSNumber numberWithInt:kAudioFormatAppleLossless], AVFormatIDKey,[NSNumber numberWithInt:1], AVNumberOfChannelsKey, [NSNumber numberWithInt:AVAudioQualityMax], AVEncoderAudioQualityKey, nil];
    _soundRecorder=[[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:filePath] settings:recordSettings error:nil];
    _soundRecorder.delegate=self;
    [_soundRecorder record];
    
}

- (IBAction)stopRecorder {
    
    [_soundRecorder stop];
    
}

- (IBAction)playAudioRecording {
    
    NSString *file=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/recording.mp3"];

    AVAudioPlayer *newPlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:file] error:nil];
    newPlayer.delegate=self;
    [newPlayer play];
    
    
}

-(void) audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    
    NSLog(@"did finish recording");
    
}

-(void) audioRecorderBeginInterruption:(AVAudioRecorder *)recorder{
    
    NSLog(@"recording was interrupted");
    
}


@end
