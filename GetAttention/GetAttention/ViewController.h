//
//  ViewController.h
//  GetAttention
//
//  Created by Mani Batra on 10/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UIAlertViewDelegate, UIActionSheetDelegate, AVAudioPlayerDelegate>{
    
    IBOutlet UILabel *userOutput;
    UITextField *userInput;
    AVAudioPlayer *player;
    
}

@property (nonatomic, retain) UILabel *userOutput;
@property (nonatomic, retain) UITextField *userInput;
@property (nonatomic, retain) AVAudioPlayer *player;



-(IBAction)doAlert:(id)sender;
-(IBAction)doMultiButtonAlert:(id)sender;
-(IBAction)doAlertInput:(id)sender;
-(IBAction)doAlertSound:(id)sender;
-(IBAction)doSound:(id)sender;
-(IBAction)doActionSheet:(id)sender;
-(IBAction)doVibration:(id)sender;


@end
