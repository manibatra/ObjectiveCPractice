//
//  VideoViewController.m
//  CameraVideo
//
//  Created by Mani Batra on 29/01/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController
@synthesize videoPreview, videoImage, stillImageOutput;

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
	// Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated{
    
    
    AVCaptureSession *session=[[AVCaptureSession alloc] init];
    
    session.sessionPreset=AVCaptureSessionPresetMedium;
    
    
    AVCaptureVideoPreviewLayer *captureVideoPreviewLayer=[[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    
    captureVideoPreviewLayer.frame=CGRectMake(0, 0, 50, 50);
    [self.videoPreview.layer addSublayer:captureVideoPreviewLayer];
    
    
    AVCaptureDevice *device=[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error=nil;
    
    AVCaptureDeviceInput *input=[AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    
    
    if (!input) {
        NSLog(@"ERROR: trying to open camera %@", error);
    }
    
    [session addInput:input];
    
    
    stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    
    NSDictionary *outputSettings=[[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    
    [stillImageOutput setOutputSettings:outputSettings];
    
    [session addOutput:stillImageOutput];
    
    
    [session startRunning];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)captureScreen:(id)sender {
    
    
    AVCaptureConnection *videoConnection= nil;
    
    
    for (AVCaptureConnection *connection in stillImageOutput.connections) {
        
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            
            if ([port mediaType] == AVMediaTypeVideo) {
                
                videoConnection=connection;
                break;
                
            }
            
        }
        
        
        if (videoConnection) {
            break;
        }
        
        
    }
    
    
    NSLog(@"about to request a capture from %@", stillImageOutput);
    
    [stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        
        CFDictionaryRef exifAttatchments=CMGetAttachment(imageDataSampleBuffer, kCGImagePropertyExifDictionary, NULL);
        
        if (exifAttatchments) {
            
            NSLog(@"attatchments : %@", exifAttatchments);
            
        }else{
            
            NSLog(@"No attatchments");
            
        }
        
        NSData *imageData=[AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        
        UIImage *image=[[UIImage alloc] initWithData:imageData];
        
        self.videoImage.image=image;
        
    }];
    
    
}
@end
