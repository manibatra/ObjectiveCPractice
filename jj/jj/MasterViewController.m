//
//  MasterViewController.m
//  jj
//
//  Created by Mani Batra on 15/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"



@implementation MasterViewController


-(void) createFlowerData{
    NSMutableArray *redFlowers;
    NSMutableArray *blueFlowers;
    
    flowerSections=[[NSMutableArray alloc] initWithObjects:@"Red Flowers", @"Blue Flowers", nil];
    
    redFlowers=[[NSMutableArray alloc] init];
    blueFlowers=[[NSMutableArray alloc] init];
    
    [redFlowers addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Poppy", @"name", @"Poppy.png",@"picture",@"http://en.wikipedia.org/wiki/Poppy",@"url", nil]];
    
    [redFlowers addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Tulip", @"name", @"tulip.png",@"picture",@"http://en.wikipedia.org/wiki/Tulip",@"url", nil]];
    
    [blueFlowers addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Hyacinth", @"name", @"hyacinth.png",@"picture",@"http://en.wikipedia.org/wiki/Hyacinth",@"url", nil]];
    [blueFlowers addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Hydrangea", @"name", @"hydrangea.png",@"picture",@"http://en.wikipedia.org/wiki/Hydrangea",@"url", nil]];
    
    flowerData=[[NSMutableArray alloc] initWithObjects:redFlowers, blueFlowers, nil];
    
    [redFlowers release];
    [blueFlowers release];
    
    
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Flower List", @"Flower List");
    }
    return self;
}
							
- (void)dealloc
{
    [super dealloc];
}

- (void)viewDidLoad
{
    [self createFlowerData];
    [super viewDidLoad];
	
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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return [flowerSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [[flowerData objectAtIndex:section] count];
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [flowerSections objectAtIndex:section];
    
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }


    [[cell textLabel] setText:[[[flowerData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"name"]];
    
    [[cell imageView ] setImage:[UIImage imageNamed:[[[flowerData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"picture"]]];  
    return cell;
    
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    DetailViewController *detailViewController=[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    detailViewController.detailURL=[[NSURL alloc] initWithString:[[[flowerData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"url"]];
    
    detailViewController.title=[[[flowerData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"name"];
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    
    

}

@end
