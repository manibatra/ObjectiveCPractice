//
//  RSSTableViewController.m
//  Fovissste
//
//  Created by Mani Batra on 25/05/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "RSSTableViewController.h"

#import "RSSDetailViewController.h"

@interface RSSTableViewController ()

@end

@implementation RSSTableViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    feeds=[[NSMutableArray alloc] init];
    NSURL *url=[NSURL URLWithString:@"http://www.fovissste.gob.mx/es/FOVISSSTE/Noticias/_rid/363/_mto/3/_mod/rss"];
    
    parser=[[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    cell.textLabel.text=[[feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     RSSDetailViewController *detailViewController = [[RSSDetailViewController alloc] initWithNibName:@"RSSDetailViewController" bundle:nil];
    NSString *string=[feeds[indexPath.row] objectForKey:@"link"];
    [detailViewController setUrl:string];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    element=elementName;
    
    if([element isEqualToString:@"item"]){
        
        item=[[NSMutableDictionary alloc] init];
        link=[[NSMutableString alloc] init];
        title=[[NSMutableString alloc] init];
        
    }
    
    
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if([element isEqualToString:@"title"])
        [title appendString:string];
    else if ([element isEqualToString:@"link"])
        [link appendString:string];
    
    
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if ([elementName isEqualToString:@"item"]) {
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        [feeds addObject:[item copy]];
    }
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    [self.tableView reloadData];
    
}

@end
