//
//  FlowerColorTableViewController.m
//  FlowerColorTable
//
//  Created by Mani Batra on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define sectionCount 2
#define redSection 0
#define blueSection 1
#import "FlowerColorTableViewController.h"

@interface FlowerColorTableViewController ()

@end

@implementation FlowerColorTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    redFlowers=[[NSMutableArray alloc] initWithObjects:@"Gerbera",@"Peony",@"Rose",@"Poopy",@"Tulip",@"Anthurium",@"Anemone", nil];
    blueflowers=[[NSMutableArray alloc] initWithObjects:@"Hyacinth", @"Hydrangea",@"Sea Holly",@"Phlox", @"Iris",@"Bluebell",@"Cyanis", nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case redSection:
            return @"Red";
            break;
            
        case blueSection:
            return @"Blue";
            
        default:
            return @"Unknown";


    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return sectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case redSection:
            return [redFlowers count];
            break;
            
        case blueSection:
            return [blueflowers count];
            
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil)
    {
        cell=[[[UITableViewCell alloc] initWithFrame:CGRectZero
                                     reuseIdentifier:CellIdentifier]autorelease];
    }
    switch (indexPath.section) {
        case redSection:
            [[cell textLabel]
        setText:[redFlowers objectAtIndex:indexPath.row]];
            break;
        case blueSection:
             [[cell textLabel]
        setText:[blueflowers objectAtIndex:indexPath.row]];
            break;
            
        default:
            [[cell textLabel] setText:@"Unknown"];
            break;
    }
    
    return cell;
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    UIAlertView *showSelection;
    NSString *flowerMessage;
    
    switch (indexPath.section) {
        case redSection:
            flowerMessage=[[NSString alloc] initWithFormat:@"You chose the red flower - %@",[redFlowers objectAtIndex:indexPath.row]];
            break;
        case blueSection:
            flowerMessage=[[NSString alloc] initWithFormat:@"You chose the blue flower - %@",[blueflowers objectAtIndex:indexPath.row]];
            break;
            
        default:
            flowerMessage=[[NSString alloc] initWithFormat:@"I have no idea what you chose!?"];
            break;
    }

    showSelection=[[UIAlertView alloc] initWithTitle:@"Flower Selected" message:flowerMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [showSelection show];
    [showSelection release];
    [flowerMessage release];
    
}

@end
