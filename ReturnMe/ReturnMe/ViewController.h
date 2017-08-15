//
//  ViewController.h
//  ReturnMe
//
//  Created by Mani Batra on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define kName @"name"
#define kEmail @"email"
#define kPhone @"phone"
#define kPicture @"picture"

#import <UIKit/UIKit.h>



@interface ViewController : UIViewController{
    
    IBOutlet UIImageView *picture;
    IBOutlet UILabel *name;
    IBOutlet UILabel *email;
    IBOutlet UILabel *phone;
    
}

@property (nonatomic, retain) UIImageView *picture;
@property (nonatomic, retain) UILabel *name;
@property (nonatomic, retain) UILabel *email;
@property (nonatomic, retain) UILabel *phone;

@end
