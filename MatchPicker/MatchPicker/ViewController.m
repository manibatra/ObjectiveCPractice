//
//  ViewController.m
//  MatchPicker
//
//  Created by Mani Batra on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define componentCount 2
#define animalComponent 0
#define soundComponent 1

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lastAction;
@synthesize matchResult;

- (void)viewDidLoad
{
    int a=14,b=10;
    printf("%i",a/b);
    animalNames=[[NSArray alloc] initWithObjects:@"Mouse",@"Goose",@"Cat",@"Dog",@"Snake",@"Bear",@"Pig" ,nil];
    animalSounds=[[NSArray alloc] initWithObjects:@"Oink",@"Rawr", @"Ssss", @"Roof", @"Meow", @"Honk",@"Squeak", nil];
    animalImages=[[NSArray alloc] initWithObjects:
                  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mouse.png"]],
                   [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goose.png"]],
                    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cat.png"]],
                      [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dog.png"]],
                       [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snake.png"]],
                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bear.png"]],
                         [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pig.png"]],nil];
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView*) pickerView{
    return componentCount;
    
}

-(NSInteger) pickerView:(UIPickerView*) pickerView numberOfRowsInComponent:(NSInteger) component{
    
    if (component==animalComponent) {
        return [animalNames count]*1000;
            } else {
                return [animalSounds count]*1000;
                    }
    
}

/*-(NSString*) pickerView:(UIPickerView*) pickerView titleForRow:(NSInteger) row forComponent:(NSInteger) component{
    
    if (component==animalComponent) {
        return [animalNames objectAtIndex:row];
            } else {
                return [animalSounds objectAtIndex:row];
                    }
    
}*/


-(UIView*) pickerView:(UIPickerView*) pickerView viewForRow:(NSInteger) row forComponent:(NSInteger) component reusingView:(UIView *)view{
    
    if (component==animalComponent) {
        
                    return [animalImages objectAtIndex:(row-((row/7)*7))];

                    
            } else {
                UILabel *soundLabel;
                soundLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 32)];
                [soundLabel autorelease];
                soundLabel.backgroundColor=[UIColor clearColor];
                soundLabel.text=[animalSounds objectAtIndex:(row-((row/7)*7))];
                return soundLabel;
                    }
    
}

-(void) pickerView: (UIPickerView*)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger) component{
    
    NSString *actionMessage;
    NSString *matchMessage;
    
    int selectedAnimal;
    int selectedSound;
    int match;
    
    if (component==animalComponent) {
        
                    actionMessage=[[NSString alloc] initWithFormat:@"You selected the animal named %@", [animalNames objectAtIndex:(row-((row/7)*7))]];

                        }
        
            else {
                
                    actionMessage=[[NSString alloc] initWithFormat:@"You selected the animal sound %@", [animalSounds objectAtIndex:(row-((row/7)*7))]];
                    
                

                    }
    
    
    selectedAnimal=([pickerView selectedRowInComponent:animalComponent]-(([pickerView selectedRowInComponent:animalComponent]/7)*7));
    selectedSound=([pickerView selectedRowInComponent:soundComponent]-(([pickerView selectedRowInComponent:soundComponent]/7)*7));

    
    match=([animalNames count]-1)-([pickerView selectedRowInComponent:soundComponent]-(([pickerView selectedRowInComponent:soundComponent]/7)*7));
    
    if (match==selectedAnimal) {
        matchMessage=[[NSString alloc] initWithFormat:@"Yes, a %@ does go   '%@' !",[animalNames objectAtIndex:selectedAnimal], [animalSounds objectAtIndex:(selectedSound-((selectedSound/7)*7))]];
            } else {
                matchMessage=[[NSString alloc] initWithFormat:@"No, a %@ doesnt go   '%@' !",[animalNames objectAtIndex:selectedAnimal], [animalSounds objectAtIndex:(selectedSound-((selectedSound/7)*7))]];

                    }
    
    lastAction.text=actionMessage;
    matchResult.text=matchMessage;


[actionMessage release];
[matchMessage release];
    
}

-(CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 55.0;
}

-(CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    
    if (component==animalComponent) {
        return 75.0;
            } else {
                return 150.0;
                    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void) dealloc{
    
    [animalNames release];
    [animalSounds release];
    [animalImages release];
    [lastAction release];
    [matchResult release];
    [super dealloc];
}

@end
