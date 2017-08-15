//
//  RequestViewController.h
//  Goal
//
//  Created by Mani Batra on 26/02/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FriendProtocol.h"

@interface RequestViewController : UIViewController<FBFriendPickerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *authButton;
- (IBAction)authButtonAction:(id)sender;

@property (strong, nonatomic) FBFriendPickerViewController *friendPickerController;

- (IBAction)newRequest:(id)sender;


@end
