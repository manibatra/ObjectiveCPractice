//
//  VideoViewController.h
//  CameraVideo
//
//  Created by Mani Batra on 29/01/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <ImageIO/CGImageProperties.h>

@interface VideoViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *videoPreview;

@property (nonatomic, retain) AVCaptureStillImageOutput *stillImageOutput;

@property (weak, nonatomic) IBOutlet UIImageView *videoImage;
- (IBAction)captureScreen:(id)sender;

@end
