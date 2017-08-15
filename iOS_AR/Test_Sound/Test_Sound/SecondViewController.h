//
//  SecondViewController.h
//  Test_Sound
//
//  Created by Mani Batra on 23/10/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SecondViewController : UIViewController<AVAudioPlayerDelegate, AVAudioRecorderDelegate>{
    
    AVAudioRecorder *_soundRecorder;
    
}

- (IBAction)startRecorder;
- (IBAction)stopRecorder;
- (IBAction)playAudioRecording;


@end
