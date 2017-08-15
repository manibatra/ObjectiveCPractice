//
//  CustomHeader.h
//  CoolTable
//
//  Created by Mani Batra on 03/11/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomHeader : UIView{
    
    UILabel *_titleLabel;
    UIColor *_lightColor;
    UIColor *_darkColor;
    CGRect _coloredBoxRect;
    CGRect _paperRect;
    
    
    
    
}

@property (retain) UIColor *lightColor;
@property (retain) UIColor *darkColor;
@property (retain) UILabel *titleLabel;


@end
