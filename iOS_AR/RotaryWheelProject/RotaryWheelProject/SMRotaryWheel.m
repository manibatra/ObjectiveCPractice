//
//  SMRotaryWheel.m
//  RotaryWheelProject
//
//  Created by Mani Batra on 25/11/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "SMRotaryWheel.h"
#import <QuartzCore/QuartzCore.h>

static float deltaAngle;
static float minAlphaValue=0.6;
static float maxAlphaValue=1.0;


@implementation SMRotaryWheel
@synthesize numberOfSections, container, delegate, startTransform, sectors, currentSector;

- (id) initWithFrame:(CGRect)frame andDelegate:(id)del withSections:(int)sectionsNumber {
    // 1 - Call super init
    if ((self = [super initWithFrame:frame])) {
        // 2 - Set properties
        self.numberOfSections = sectionsNumber;
        self.delegate = del;
        // 3 - Draw wheel
        [self drawWheel];
	}
    return self;
}

- (void) drawWheel {
    // 1
    container = [[UIView alloc] initWithFrame:self.frame];
    //container.layer.backgroundColor=[UIColor blackColor].CGColor;
    // 2
    CGFloat angleSize = 2*M_PI/numberOfSections;
    // 3
    for (int i = 0; i < numberOfSections; i++) {
        // 4 - Create image view
        UIImageView *im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"segment.png"]];
        im.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
        im.layer.position = CGPointMake(container.bounds.size.width/2.0-container.frame.origin.x,
                                        container.bounds.size.height/2.0-container.frame.origin.y);
        im.transform = CGAffineTransformMakeRotation(angleSize*i);
        im.alpha = minAlphaValue;
        im.tag = i;
        if (i == 0) {
            im.alpha = maxAlphaValue;
        }
		// 5 - Set sector image
        UIImageView *sectorImage = [[UIImageView alloc] initWithFrame:CGRectMake(12, 15, 40, 40)];
        sectorImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"icon%i.png", i]];
        [im addSubview:sectorImage];
        // 6 - Add image view to container
        [container addSubview:im];
	}
    self.currentSector=0;
    
    // 7
    container.userInteractionEnabled = NO;
    [self addSubview:container];
    
    UIImageView *bg=[[UIImageView alloc] initWithFrame:self.frame];
    bg.image=[UIImage imageNamed:@"bg.png"];
    [self addSubview:bg];
    
    UIImageView *mask = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 58, 58)];
    mask.image =[UIImage imageNamed:@"centerButton.png"] ;
    mask.center = self.center;
    mask.center = CGPointMake(mask.center.x, mask.center.y+3);
    [self addSubview:mask];
    
    
    self.sectors=[NSMutableArray arrayWithCapacity:numberOfSections];
    if (numberOfSections%2==0) {
        [self buildSectorsEven];
    }else{
        [self buildSectorsOdd];
    }
    
    
    [self.delegate wheelDidChangeValue:[NSString stringWithFormat:[self getSectorName:currentSector]]];
    
}

-(void)rotate{
    
    
    CGAffineTransform t=CGAffineTransformRotate(container.transform, -0.78);
    container.transform=t;
    
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    // 1 - Get touch position
    CGPoint touchPoint = [touch locationInView:self];
    // 1.1 - Get the distance from the center
//    float dist = [self calculateDistanceFromCenter:touchPoint];
//    
//    NSLog(@"%f",dist);
//    // 1.2 - Filter out touches too close to the center
//    if (dist < 40 || dist > 100)
//    {
//        // forcing a tap to be on the ferrule
//        NSLog(@"ignoring tap (%f,%f)", touchPoint.x, touchPoint.y);
//        return NO;
//    }
    float dx = touchPoint.x - container.center.x;
    float dy = touchPoint.y - container.center.y;
    // 3 - Calculate arctangent value
    deltaAngle = atan2(dy,dx);
    // 4 - Save current transform
    startTransform = container.transform;
    UIImageView *im=[self getSectorByValue:currentSector];
    im.alpha=minAlphaValue;
    return YES;
}
- (BOOL)continueTrackingWithTouch:(UITouch*)touch withEvent:(UIEvent*)event
{
    CGFloat radians = atan2f(container.transform.b, container.transform.a);
    NSLog(@"rad is %f", radians);
    CGPoint pt = [touch locationInView:self];
    float dx = pt.x  - container.center.x;
    float dy = pt.y  - container.center.y;
    float ang = atan2(dy,dx);
    float angleDifference = deltaAngle - ang;
    container.transform = CGAffineTransformRotate(startTransform, -angleDifference);
        return YES;
}
- (float) calculateDistanceFromCenter:(CGPoint)point {
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    float dx = point.x - center.x;
    float dy = point.y - center.y;
    return sqrt(dx*dx + dy*dy);
}

-(void)buildSectorsEven{
    
    CGFloat fanWidth=M_PI*2/numberOfSections;
    
    CGFloat mid=0;
    
    for (int i=0; i<numberOfSections; i++) {
        
        SMSector *sector=[[SMSector alloc] init];
        sector.midValue=mid;
        sector.minValue=mid-fanWidth/2;
        sector.maxValue=mid+fanWidth/2;
        sector.sector=i;
        if(sector.maxValue-fanWidth<-M_PI){
            
            mid=M_PI;
            sector.midValue=mid;
            sector.minValue=fabsf(sector.maxValue);
            
        }
        
        mid-=fanWidth;
        
        NSLog(@"cl is %@", sector);
    
        [sectors addObject:sector];
    }
    
    
}
- (void) buildSectorsOdd {
	// 1 - Define sector length
    CGFloat fanWidth = M_PI*2/numberOfSections;
	// 2 - Set initial midpoint
    CGFloat mid = 0;
	// 3 - Iterate through all sectors
    for (int i = 0; i < numberOfSections; i++) {
        SMSector *sector = [[SMSector alloc] init];
		// 4 - Set sector values
        sector.midValue = mid;
        sector.minValue = mid - (fanWidth/2);
        sector.maxValue = mid + (fanWidth/2);
        sector.sector = i;
        mid -= fanWidth;
        if (sector.minValue < - M_PI) {
            mid = -mid;
            mid -= fanWidth;
        }
		// 5 - Add sector to array
        [sectors addObject:sector];
		NSLog(@"cl is %@", sector);
    }
}


-(void) endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    
    CGFloat radians=atan2f(container.transform.b, container.transform.a);
    
    CGFloat newVal=0;
    
    for(SMSector *s in sectors){
        
        if (s.minValue > 0 && s.maxValue < 0) {
            if (s.maxValue > radians || s.minValue < radians) {
                // 5 - Find the quadrant (positive or negative)
                if (radians > 0) {
                    newVal = radians - M_PI;
                } else {
                    newVal = M_PI + radians;
                }
                currentSector = s.sector;
            }
        }
        // 6 - All non-anomalous cases
        else if (radians > s.minValue && radians < s.maxValue) {
            newVal = radians - s.midValue;
            currentSector = s.sector;
        }

        
        
          [self.delegate wheelDidChangeValue:[NSString stringWithFormat:[self getSectorName:currentSector]]];
        
    }
    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    CGAffineTransform t=CGAffineTransformRotate(container.transform, -newVal);
    container.transform=t;
    [UIView commitAnimations];
    
    UIImageView *im = [self getSectorByValue:currentSector];
    im.alpha = maxAlphaValue;

    
}

-(UIImageView*)getSectorByValue:(int)value{
    
    UIImageView *res;
    
    NSArray *views=[container subviews];
    
    for (UIImageView *im in views) {
        if (im.tag==value) {
            res=im;
        }
    }
    
    return res;
    
}

- (NSString *) getSectorName:(int)position {
    NSString *res = @"";
    switch (position) {
        case 0:
            res = @"Circles";
            break;
            
        case 1:
            res = @"Flower";
            break;
            
        case 2:
            res = @"Monster";
            break;
            
        case 3:
            res = @"Person";
            break;
            
        case 4:
            res = @"Smile";
            break;
            
        case 5:
            res = @"Sun";
            break;
            
        case 6:
            res = @"Swirl";
            break;
            
        case 7:
            res = @"3 circles";
            break;
            
        case 8:
            res = @"Triangle";
            break;
            
        default:
            break;
    }
    return res;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
