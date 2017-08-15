//
//  ViewController.h
//  TabbedCalculation
//
//  Created by Mani Batra on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITabBarControllerDelegate>{
    
    IBOutlet UITabBarController *tabBarController;
    
    
}

@property (nonatomic, retain) UITabBarController *tabBarController;

@end
