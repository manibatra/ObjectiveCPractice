//
//  AddGoalsViewController.h
//  Goal
//
//  Created by Mani Batra on 17/02/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddGoalsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *goal;
@property (weak, nonatomic) IBOutlet UITextField *number;
@property (weak, nonatomic) IBOutlet UITextField *unit;
@property (weak, nonatomic) IBOutlet UITextView *note;

- (IBAction)saveGoal:(id)sender;

- (IBAction)hideKeyBoard:(id)sender;

@end
