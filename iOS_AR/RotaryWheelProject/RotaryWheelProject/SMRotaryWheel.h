//
//  SMRotaryWheel.h
//  RotaryWheelProject
//
//  Created by Mani Batra on 25/11/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMRotaryProtocol.h"
#import "SMSector.h"

@interface SMRotaryWheel : UIControl

@property(weak) id<SMRotaryProtocol> delegate;
@property(strong, nonatomic) UIView *container;
@property int numberOfSections;
@property CGAffineTransform startTransform;
@property NSMutableArray *sectors;
@property int currentSector;


-(id) initWithFrame:(CGRect)frame andDelegate:(id) del withSections:(int)sectionsNumber;
-(float) calculateDistanceFromCenter:(CGPoint) point;
-(void)buildSectorsEven;
-(void)buildSectorsOdd;
-(UIImageView*)getSectorByValue: (int) value;
@end
