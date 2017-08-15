//
//  ViewController.h
//  FlowerWeb
//
//  Created by Mani Batra on 10/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    
    IBOutlet UISegmentedControl *colorChoice;
    IBOutlet UIWebView *flowerView;
    IBOutlet UIWebView *flowerDetailView;
    
    
    
}

@property (nonatomic, retain) UISegmentedControl *colorChoice;
@property (nonatomic, retain) UIWebView *flowerView;
@property (nonatomic, retain) UIWebView *flowerDetailView;

-(IBAction)getFlower:(id)sender;
-(IBAction)toggleFlowerdetail:(id)sender;



@end
