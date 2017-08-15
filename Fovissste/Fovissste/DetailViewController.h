//
//  DetailViewController.h
//  Fovissste
//
//  Created by Mani Batra on 07/12/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UIWebView *detailWebView;
@property (nonatomic, strong) NSURL *detailURL;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (nonatomic, strong) NSString *infoString;

@end
