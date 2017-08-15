//
//  AppDelegate.h
//  MyGame
//
//  Created by Mani Batra on 31/01/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "cocos2d.h"
#import "chipmunk.h"
#import "MenuLayer.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate, AVCaptureVideoDataOutputSampleBufferDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;
	
	CCDirectorIOS	*director_;							// weak ref
    
    AVCaptureSession *_session;
    UIView *cameraView;
    UIImageView *_imageView;
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;

@end
