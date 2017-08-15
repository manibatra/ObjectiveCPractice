//
//  CustomCellBackground.h
//  CoolTable
//
//  Created by Mani Batra on 29/10/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellBackground : UIView{
    
    BOOL _lastCell;
    BOOL _selected;
    
}

@property  BOOL lastCell;
@property  BOOL selected;

@end
