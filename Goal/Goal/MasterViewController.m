//
//  MasterViewController.m
//  Goal
//
//  Created by Mani Batra on 03/02/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "AddPriorityViewController.h"

#import "AddGoalsViewController.h"

#import "AddBucketListViewController.h"

#import "AppDelegate.h"

@interface MasterViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation MasterViewController
@synthesize entityName;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight=100;
    //self.tableView.backgroundColor=[UIColor clearColor];
    
    //self.tableView.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gradientBackground.png"]];
    
    UIView *containerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 60)];
    UILabel *headerLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 40)];
    
    headerLabel.text=NSLocalizedString(@"Header for the table", @"");
    headerLabel.textColor=[UIColor whiteColor];
    headerLabel.shadowColor=[UIColor blackColor];
    headerLabel.shadowOffset=CGSizeMake(0, 1);
    headerLabel.font=[UIFont boldSystemFontOfSize:22];
    headerLabel.backgroundColor=[UIColor clearColor];
    
    [containerView addSubview:headerLabel];
    
    self.tableView.tableHeaderView=containerView;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender


{
    
    if ([entityName isEqualToString:@"Priorities"]) {
        
        [self presentViewController:[[AddPriorityViewController alloc] initWithNibName:@"AddPriorityViewController" bundle:nil ] animated:YES completion:nil];
        
    } else if ([entityName isEqualToString:@"Goals"]) {
        
        [self presentViewController:[[AddGoalsViewController alloc] initWithNibName:@"AddGoalsViewController" bundle:nil ] animated:YES completion:nil];
        
    } else if ([entityName isEqualToString:@"BucketList"]) {
        
        [self presentViewController:[[AddBucketListViewController alloc] initWithNibName:@"AddBucketListViewController" bundle:nil ] animated:YES completion:nil];
        
    }
    
//    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
//    
//    NSManagedObjectContext *context = [delegate managedObjectContext];
//    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
//    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
//    
//    // If appropriate, configure the new managed object.
//    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
//    [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
//    
//    // Save the context.
//    NSError *error = nil;
//    if (![context save:&error]) {
//         // Replace this implementation with code to handle the error appropriately.
//         // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        abort();
//    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    
    UIImage *rowBackground;
    UIImage *selectionBackground;
    
    NSInteger sectionRows=[tableView numberOfRowsInSection:[indexPath section]];
    
    NSInteger row=[indexPath row];
    
    if (row==0 && row==sectionRows-1) {
        
        rowBackground=[UIImage imageNamed:@"topAndBottomRow.png"];
        selectionBackground=[UIImage imageNamed:@"topAndBottomRowSelected.png"];
        
    }else if (row==0){
        
        rowBackground=[UIImage imageNamed:@"topRow.png"];
        selectionBackground=[UIImage imageNamed:@"topRowSelected.png"];
        
        
    }else if (row==sectionRows-1){
        
        
        rowBackground=[UIImage imageNamed:@"bottomRow.png"];
        selectionBackground=[UIImage imageNamed:@"bottomRowSelected.png"];
        
    }else{
        
        
        rowBackground=[UIImage imageNamed:@"middleRow.png"];
        selectionBackground=[UIImage imageNamed:@"middleRowSelected.png"];
        
    }
    
    cell.backgroundView=[[UIImageView alloc] initWithImage:rowBackground];
    cell.selectedBackgroundView=[[UIImageView alloc] initWithImage:selectionBackground];
    
    const CGFloat LABEL_HEIGHt=20;
    UIImage *image=[UIImage imageNamed:@"imageA"];
    
    UILabel *topLabel=[[UILabel alloc] initWithFrame:CGRectMake(image.size.width+2.0*cell.indentationWidth, 0.5*(tableView.rowHeight-2*LABEL_HEIGHt), tableView.bounds.size.width-image.size.width-4.0*cell.indentationWidth-cell.accessoryView.frame.size.width, LABEL_HEIGHt)];
    
    [cell.contentView addSubview:topLabel];
    
    [[cell imageView] setImage:image];
   // topLabel.tag = TOP_LABEL_TAG;
    topLabel.backgroundColor = [UIColor clearColor];
    topLabel.textColor = [UIColor colorWithRed:0.25 green:0.0 blue:0.0 alpha:1.0];
    topLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
    topLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
    topLabel.lineBreakMode=NSLineBreakByWordWrapping;
    
    
    
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
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }   
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    

    
   
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:[delegate managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[delegate managedObjectContext] sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	     // Replace this implementation with code to handle the error appropriately.
	     // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}    

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
 */

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
//    NSArray *data=[self.fetchedResultsController fetchedObjects];
//    if (indexPath.row==0) {
//        NSManagedObject *object=[data objectAtIndex:indexPath.row];
//        cell.textLabel.text = [[object valueForKey:@"aim"] description];
//    }
//    else if (indexPath.row%2==0) {
//        NSManagedObject *object=[data objectAtIndex:indexPath.row/2];
//        cell.textLabel.text = [[object valueForKey:@"aim"] description];
//
//    }
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [[object valueForKey:@"aim"] description];
//    cell.textLabel.text = @"";
//    }
}

@end
