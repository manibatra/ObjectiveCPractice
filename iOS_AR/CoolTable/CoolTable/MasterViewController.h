//
//  MasterViewController.h
//  CoolTable
//
//  Created by Mani Batra on 29/10/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController{
    
    NSMutableArray *_thingsToLearn;
    NSMutableArray *_thingsLearned;
    
}

@property (copy) NSMutableArray *thingsToLearn;
@property (copy) NSMutableArray *thingsLearned;



@property (strong, nonatomic) DetailViewController *detailViewController;

@end
