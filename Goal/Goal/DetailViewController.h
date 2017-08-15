//
//  DetailViewController.h
//  Goal
//
//  Created by Mani Batra on 03/02/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
- (IBAction)finish:(id)sender;
@end
