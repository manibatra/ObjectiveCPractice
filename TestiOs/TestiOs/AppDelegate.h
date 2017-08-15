//
//  AppDelegate.h
//  TestiOs
//
//  Created by Mani Batra on 06/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    IBOutlet UIButton *checkButton;
    IBOutlet UITextField *username;
    IBOutlet UITextField *password;
    IBOutlet UIView *view;
    IBOutlet UITableView *table;
    NSMutableArray *myArray;
    IBOutlet id<UITableViewDataSource> *data;

}

@property (strong, nonatomic) IBOutlet UIWindow *window;
-(IBAction)buttonPushed:sender;
-(IBAction)donePressed:sender;
-(IBAction)changeView:sender;

@end
