//
//  RSSTableViewController.h
//  Fovissste
//
//  Created by Mani Batra on 25/05/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSTableViewController : UITableViewController <NSXMLParserDelegate>
{
    
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;

    
    
}

@end
