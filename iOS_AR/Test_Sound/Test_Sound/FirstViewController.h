//
//  FirstViewController.h
//  Test_Sound
//
//  Created by Mani Batra on 23/10/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "Parse/Parse.h"

@interface FirstViewController : UIViewController<AVAudioPlayerDelegate>{
    
    SystemSoundID _systemSound;
    AVAudioPlayer *_avAudioPlayer;
    
}

-(IBAction)systemSoundAction;
-(IBAction)avAudioPlayerAction;



@end
