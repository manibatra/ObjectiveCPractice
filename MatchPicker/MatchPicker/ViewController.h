//
//  ViewController.h
//  MatchPicker
//
//  Created by Mani Batra on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>{
    
    NSArray *animalNames;
    NSArray *animalSounds;
    NSArray *animalImages;
    IBOutlet UILabel *lastAction;
    IBOutlet UILabel *matchResult;
    
}


@property (nonatomic, retain) UILabel *lastAction;
@property (nonatomic, retain) UILabel *matchResult;

@end
