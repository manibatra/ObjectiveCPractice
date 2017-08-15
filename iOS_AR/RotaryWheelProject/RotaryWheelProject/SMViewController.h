//
//  SMViewController.h
//  RotaryWheelProject
//
//  Created by Mani Batra on 25/11/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMRotaryProtocol.h"
@interface SMViewController : UIViewController<SMRotaryProtocol>

@property (weak, nonatomic) IBOutlet UILabel *sectorLabel;


@end
