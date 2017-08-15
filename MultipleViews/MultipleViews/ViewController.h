//
//  ViewController.h
//  MultipleViews
//
//  Created by Mani Batra on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FirstViewController;
@class SecondViewController;
@class ThirdViewController;

@interface ViewController : UIViewController{
    
    IBOutlet FirstViewController *firstViewController;
    IBOutlet SecondViewController *secondViewController;
    IBOutlet ThirdViewController *thirdViewController;
    
}

@property (nonatomic, retain) FirstViewController *firstViewController;
@property (nonatomic, retain) SecondViewController *secondViewController;
@property (nonatomic, retain) ThirdViewController *thirdViewController;


-(IBAction)loadFirstView:(id)sender;
-(IBAction)loadSecondView:(id)sender;
-(IBAction)loadThirdView:(id)sender;


-(void) clearView;



@end
