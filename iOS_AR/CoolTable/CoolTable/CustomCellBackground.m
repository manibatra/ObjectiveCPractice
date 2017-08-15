//
//  CustomCellBackground.m
//  CoolTable
//
//  Created by Mani Batra on 29/10/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "CustomCellBackground.h"
#import "Common.h"

@implementation CustomCellBackground
@synthesize lastCell = _lastCell;
@synthesize selected = _selected;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGColorRef whiteColor=[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor;
    //CGColorRef redColor=[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0].CGColor;

    CGColorRef lightGrayColor=[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0].CGColor;

    CGColorRef separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0
                                                 blue:208.0/255.0 alpha:1.0].CGColor;
    
    CGRect paperRect=self.bounds;
    
    
    if (_selected) {
        drawLinearGradient(context, paperRect, lightGrayColor, separatorColor);
    } else {
        drawLinearGradient(context, paperRect, whiteColor, lightGrayColor);
    }

    
    if (!_lastCell) {
    
    CGRect strokeRect=paperRect;
    
    strokeRect.size.height-=1;
    strokeRect = rectFor1PxStroke(strokeRect);

    
    CGContextSetStrokeColorWithColor(context, whiteColor);
    CGContextSetLineWidth(context, 1.0);
    
    CGContextStrokeRect(context, strokeRect);
    
    CGPoint startPoint=CGPointMake(paperRect.origin.x, paperRect.origin.y+paperRect.size.height-1);
    CGPoint endPoint=CGPointMake(paperRect.origin.x+paperRect.size.width-1, paperRect.origin.y+paperRect.size.height-1);
    
    draw1pxPoint(context, startPoint, endPoint, separatorColor);
    }else {
        
        CGContextSetStrokeColorWithColor(context, whiteColor);
        CGContextSetLineWidth(context, 1.0);
        
        CGPoint pointA = CGPointMake(paperRect.origin.x,
                                     paperRect.origin.y + paperRect.size.height - 1);
        CGPoint pointB = CGPointMake(paperRect.origin.x, paperRect.origin.y);
        CGPoint pointC = CGPointMake(paperRect.origin.x + paperRect.size.width - 1,
                                     paperRect.origin.y);
        CGPoint pointD = CGPointMake(paperRect.origin.x + paperRect.size.width - 1,
                                     paperRect.origin.y + paperRect.size.height - 1);
        
        
        draw1pxPoint(context, pointA, pointB, whiteColor);
        draw1pxPoint(context, pointB, pointC, whiteColor);
        draw1pxPoint(context, pointC, pointD, whiteColor);
        
    }
    
}


@end
