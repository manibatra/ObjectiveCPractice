//
//  MasterViewController.m
//  CoolTable
//
//  Created by Mani Batra on 29/10/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "CustomCellBackground.h"

#import "CustomHeader.h"

#import "CustomFooter.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController
@synthesize thingsLearned=_thingsLearned;
@synthesize thingsToLearn=_thingsToLearn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.title=@"Core Graphics";
    
    self.thingsToLearn=[NSMutableArray arrayWithObjects:@"Drawing Rectangles", @"Drawing Arcs", @"Drawing Gradients", nil];
    
    self.thingsLearned=[NSMutableArray arrayWithObjects:@"UIKit", @"Objective C", @"Table Views", nil];
    
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return _thingsToLearn.count;
    }else{
        
        return _thingsLearned.count;
        
    }
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundView=[[CustomCellBackground alloc] init];
        cell.selectedBackgroundView=[[CustomCellBackground alloc] init];
        ((CustomCellBackground *)cell.selectedBackgroundView).selected = YES;

        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSString *entry;
    
    if (indexPath.section==0) {
        entry=[_thingsToLearn objectAtIndex:indexPath.row];
        ((CustomCellBackground *)cell.backgroundView).lastCell =
        indexPath.row == _thingsToLearn.count - 1;
        ((CustomCellBackground *)cell.selectedBackgroundView).lastCell =
        indexPath.row == _thingsToLearn.count - 1;
    }else{
        
        entry=[_thingsLearned objectAtIndex:indexPath.row];
        ((CustomCellBackground *)cell.backgroundView).lastCell =
        indexPath.row == _thingsLearned.count - 1;
        ((CustomCellBackground *)cell.selectedBackgroundView).lastCell =
        indexPath.row == _thingsLearned.count - 1;
        
    }


    //NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = entry;
    cell.textLabel.backgroundColor=[UIColor clearColor];
    cell.textLabel.highlightedTextColor = [UIColor blackColor];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
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
    if (!self.detailViewController) {
        self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    }
    NSDate *object = _objects[indexPath.row];
    self.detailViewController.detailItem = object;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        return @"Things We'll learn";
    }else{
        
        return @"Things Already Covered";
        
    }
    
    
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    CustomHeader *header=[[CustomHeader alloc] init];
    header.titleLabel.text=[self tableView:tableView titleForHeaderInSection:section];
    if (section == 1) {
        header.lightColor = [UIColor colorWithRed:147.0/255.0 green:105.0/255.0
                                             blue:216.0/255.0 alpha:1.0];
        header.darkColor = [UIColor colorWithRed:72.0/255.0 green:22.0/255.0
                                            blue:137.0/255.0 alpha:1.0];
    }
    return header;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 15;
    
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    CustomFooter *footer=[[CustomFooter alloc] init];
    return footer;
    
    
}



@end
