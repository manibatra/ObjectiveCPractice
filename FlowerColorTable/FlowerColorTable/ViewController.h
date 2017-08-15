//
//  ViewController.h
//  FlowerColorTable
//
//  Created by Mani Batra on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlowerColorTableViewController.h"

@interface ViewController : UIViewController
{
    
    IBOutlet FlowerColorTableViewController *flowerColorTableViewController;
    
}


@property (nonatomic, retain) FlowerColorTableViewController *flowerColorTableViewController;

@end
