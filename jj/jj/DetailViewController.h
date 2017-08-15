//
//  DetailViewController.h
//  jj
//
//  Created by Mani Batra on 15/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
    
    IBOutlet UIWebView *detailWebView;
    NSURL *detailURL;
    
}

@property (strong, nonatomic) NSURL *detailURL;

@property (strong, nonatomic) IBOutlet UIWebView *detailWebView;

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;



@end
