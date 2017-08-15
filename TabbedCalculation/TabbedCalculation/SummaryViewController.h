//
//  SummaryViewController.h
//  TabbedCalculation
//
//  Created by Mani Batra on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummaryViewController : UIViewController{
    
   IBOutlet UILabel *totalCalculations;
    int calcCount;
    
}

@property (nonatomic, retain) UILabel *totalCalculations;

-(void) updateTotal;

@end
