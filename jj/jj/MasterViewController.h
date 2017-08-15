//
//  MasterViewController.h
//  jj
//
//  Created by Mani Batra on 15/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController{
    
    //DetailViewController *detailViewController;
    NSMutableArray *flowerData;
    NSMutableArray *flowerSections;
    
}

-(void) createFlowerData;


//@property (strong, nonatomic) DetailViewController *detailViewController;

@end
