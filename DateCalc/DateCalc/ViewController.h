//
//  ViewController.h
//  DateCalc
//
//  Created by Mani Batra on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    IBOutlet UILabel *differenceResult;
    IBOutlet UIDatePicker *date;
    
    
}

@property (nonatomic, retain) UILabel *differenceResult;

-(IBAction)showDate:(id)sender;

@end
