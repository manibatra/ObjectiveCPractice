//
//  RootViewController.h
//  
//
//  Created by Mani Batra on 21/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Contact.h"
@TabViewController


@interface RootViewController : UITableViewController{
    
    TabViewController *tabViewController;
    User *currentUser;
    
    
}

-(void) createContactsData;

@end
