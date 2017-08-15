//
//  RootViewController.h
//  TestiOs
//
//  Created by Mani Batra on 08/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController
{
    NSMutableArray *contacts;
    NSString *filePath;
}

-(void) addContact;



@end

@interface NSDictionary (sorting)

-(NSComparisonResult) compareContactNames:(NSDictionary*) contact;

@end