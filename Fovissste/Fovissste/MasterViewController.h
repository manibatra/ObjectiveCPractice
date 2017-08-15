//
//  MasterViewController.h
//  Fovissste
//
//  Created by Mani Batra on 07/12/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@class DetailViewController;
@class RSSTableViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSMutableArray *linkData;
@property (strong, nonatomic) RSSTableViewController *rssTableViewController;

-(void) createLinkData;

@end
