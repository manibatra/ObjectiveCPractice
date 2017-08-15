//
//  ViewController.h
//  ImageHop
//
//  Created by Mani Batra on 09/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    IBOutlet UIImageView *imageView;
    IBOutlet UIButton *toggleButton;
    IBOutlet UISlider *animationSpeed;
    IBOutlet UILabel *hopesPerSecond;
    IBOutlet UITextField *manual;
    int count;
    
}

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UIButton *toggleButton;
@property (nonatomic, retain) UISlider *animationSpeed;
@property (nonatomic, retain) UILabel *hopesPerSecond;
@property (nonatomic, retain) UITextField *manual;


-(IBAction)toggleAnimation:(id)sender;
-(IBAction)setSpeed:(id)sender;
-(IBAction)hideKeyboard:(id)sender;

@end
