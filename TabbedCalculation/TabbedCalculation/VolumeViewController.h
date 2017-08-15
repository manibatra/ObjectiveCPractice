//
//  VolumeViewController.h
//  TabbedCalculation
//
//  Created by Mani Batra on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SummaryViewController.h"

@interface VolumeViewController : UIViewController{
    
    IBOutlet UITextField *boxWidth;
    IBOutlet UITextField *boxLength;
    IBOutlet UITextField *boxHeight;
    IBOutlet UITextField *sphereRadius;
    IBOutlet UILabel *boxResult;
    IBOutlet UILabel *sphereResult;
    IBOutlet SummaryViewController *summaryViewController;

    
}


@property (nonatomic, retain) UITextField *boxWidth;
@property (nonatomic, retain) UITextField *boxLength;
@property (nonatomic, retain) UITextField *boxHeight;
@property (nonatomic, retain) UITextField *sphereRadius;
@property (nonatomic, retain) UILabel *sphereResult;
@property (nonatomic, retain) UILabel *boxResult;

-(IBAction)calculate:(id)sender;
-(IBAction)hideKeyboard:(id)sender;

@end
