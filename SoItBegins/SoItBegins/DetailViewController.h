//
//  DetailViewController.h
//  SoItBegins
//
//  Created by Mani Batra on 29/08/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) NSManagedObject *detailItem;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;

@end
