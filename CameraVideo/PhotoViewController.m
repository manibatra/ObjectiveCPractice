//
//  PhotoViewController.m
//  CameraVideo
//
//  Created by Mani Batra on 29/01/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController (Private)
-(void) sendEmailMessage:(UIImage*) image;
@end

@implementation PhotoViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadPhotoPicker:(id)sender {
    
    UIImagePickerController *imagePicker=[[UIImagePickerController alloc] init];
    imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
    imagePicker.cameraDevice=UIImagePickerControllerCameraCaptureModeVideo;
    imagePicker.cameraDevice=UIImagePickerControllerCameraDeviceRear;

    imagePicker.showsCameraControls=NO;
    imagePicker.toolbarHidden=YES;
    imagePicker.navigationBarHidden=YES;
    imagePicker.wantsFullScreenLayout=YES;
    imagePicker.hidesBottomBarWhenPushed=YES;
    imagePicker.cameraViewTransform=CGAffineTransformMakeScale(1.0, 1.4);
    
    imagePicker.delegate=self;
    imagePicker.allowsEditing=NO;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *image=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    NSString *jpgPath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/ConvertedJPG.jpg"];
    NSString *pngPath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/ConvertedPNG.png"];
    
   NSData *jpgData= UIImageJPEGRepresentation(image, 1.0);
    [jpgData writeToFile:jpgPath atomically:YES];
    
    NSData *pngData=UIImagePNGRepresentation(image);
    [pngData writeToFile:pngPath atomically:YES];
    
    NSError *error;
    
    NSFileManager *fileMgr=[NSFileManager defaultManager];
    NSString *documentsString=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSLog(@"Documents : %@", [fileMgr contentsOfDirectoryAtPath:documentsString error:&error]);
    
    
}

-(void)image:(UIImage*) image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo{
    
    
    UIAlertView *alert;
    if (error) {
        alert=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Unable to save image" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    }else{
        
        
        alert=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Image was saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
    }
    [alert show];
    [self dismissViewControllerAnimated:NO completion:nil];
    
    [self sendEmailMessage:image];
    
    
}

-(void) sendEmailMessage: (UIImage*) image{
    
    
    NSLog(@"Sending Email");
    
    MFMailComposeViewController *picker=[[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate=self;
    
    [picker setSubject:@"iOS Augmented Reality Chapter 6"];
    
    [picker setToRecipients:[NSArray arrayWithObjects:@"manibatra2002@gmail.com", nil]];
    
    [picker setMessageBody:@"Damn this works" isHTML:NO];
    
    NSData *data=UIImagePNGRepresentation(image);
    
    [picker addAttachmentData:data mimeType:@"image/png" fileName:@"ScreenShot"];
    
    [self presentViewController:picker animated:YES completion:nil];
    
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
