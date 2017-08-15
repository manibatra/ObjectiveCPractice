//
//  AreaViewController.h
//  TabbedCalculation
//
//  Created by Mani Batra on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SummaryViewController.h"

@interface AreaViewController : UIViewController{
    
    IBOutlet UITextField *rectWidth;
    IBOutlet UITextField *rectLength;
    IBOutlet UITextField *circleRadius;
    IBOutlet UILabel *circleResult;
    IBOutlet UILabel *rectResult;
    IBOutlet SummaryViewController *summaryViewController;
    
    
    
}


@property (nonatomic, retain) UITextField *rectWidth;
@property (nonatomic, retain) UITextField *rectLength;
@property (nonatomic, retain) UITextField *circleRadius;
@property (nonatomic, retain) UILabel *circleResult;
@property (nonatomic, retain) UILabel *rectResult;

-(IBAction)calculate:(id)sender;
-(IBAction)hideKeyboard:(id)sender;






@end
