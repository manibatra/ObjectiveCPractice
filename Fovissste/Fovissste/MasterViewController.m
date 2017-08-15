//
//  MasterViewController.m
//  Fovissste
//
//  Created by Mani Batra on 07/12/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "RSSTableViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController
@synthesize linkData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"FOVISSSTE", @"Master");
    }
    return self;
}
							
- (void)viewDidLoad
{
    [self createLinkData];
    
    [self.view setBackgroundColor:[UIColor grayColor]];

    [super viewDidLoad];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
    UIBarButtonItem *rssButton = [[UIBarButtonItem alloc] initWithTitle:@"RSS" style:UIBarButtonItemStylePlain target:self action:@selector(showRSS)];
    self.navigationItem.rightBarButtonItem = rssButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [linkData count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }


    cell.textLabel.text = [[linkData objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.textLabel.numberOfLines=3;
    [[cell imageView] setImage:[UIImage imageNamed:[[linkData objectAtIndex:indexPath.row] objectForKey:@"picture"]]];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
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
    PFObject *object=[PFObject objectWithClassName:@"Location"];
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        
        [object setObject:geoPoint forKey:@"located"];
        [object saveInBackground];
        
    }];
    
    if (!self.detailViewController) {
        self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    }
    //self.detailViewController.detailWebView
    self.detailViewController.detailURL=[[NSURL alloc] initWithString:[[linkData objectAtIndex:indexPath.row] objectForKey:@"url"]];
    self.detailViewController.infoString=[[linkData objectAtIndex:indexPath.row] objectForKey:@"info"];
    self.detailViewController.title=@"";
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

-(void)createLinkData{
    
    
    linkData=[[NSMutableArray alloc] init];
    
    [linkData addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Consulta por CURP si eres un ganador del Sorteo", @"name", @"curp.png", @"picture", @"Consulta por CURP si eres un ganador del Sorteo", @"info", @"http://sorteos.fovissste.com.mx/sorteos/cgi-bin/Sorteos/ConsultaIndividualResultado.aspx", @"url", nil]];
    
    [linkData addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Estado del Trámite de tu crédito", @"name", @"estado.png", @"picture", @"Revisa el estado de tu trámite de solicitud de crédito", @"info", @"http://originacion.fovissste.com.mx/originacion/cgi-bin/ESTADISTICASEJECUTIVAS/BsqSlctd.asp?Vs=1", @"url", nil]];
    
    [linkData addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Portal de Internet FOVISSSTE", @"name", @"portal.png", @"picture", @"Por qué no checas nuestro portal institucional", @"info", @"http://www.fovissste.gob.mx", @"url", nil]];
    
    [linkData addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Simulador de Crédito Alia2Plus", @"name", @"sim-alia2.png", @"picture", @"Simula tu crédito bajo el sistema de Créditos Alia2", @"info", @"http://originacion.fovissste.com.mx/originacion/Cgi-bin/Predictamen/SimuladorCofinanciados.aspx", @"url", nil]];
    
    [linkData addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Simulador de Crédito con Subsidio", @"name", @"sim-subsidio.png", @"picture", @"Simula tu crédito bajo el sistema de Créditos con Subsidio", @"info", @"https://originacion.fovissste.com.mx/Originacion/cgi-bin/subsidios/SimuladorSubsidios.aspx", @"url", nil]];
    
    [linkData addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Simulador de Créditos Pensiona2", @"name", @"sim-pensiona2.png", @"picture", @"Simula tu crédito bajo el sistema de Créditos Pensionados", @"info", @"http://originacion.fovissste.com.mx/originacion/cgi-bin/Jubilados/SimuladorPensionados.aspx", @"url", nil]];
    
    [linkData addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Simulador de Créditos Tradicionales", @"name", @"sim-tradicional.png", @"picture", @"Simula tu crédito bajo el sistema de Créditos Tradicionales", @"info", @"https://originacion.fovissste.com.mx/originacion/cgi-bin/Predictamen/Predictamen.aspx", @"url", nil]];
    

    
    
    
    
}

-(void)showRSS{
    
    if(!self.rssTableViewController){
        
        self.rssTableViewController=[[RSSTableViewController alloc] initWithNibName:@"RSSTableViewController" bundle:nil];
        
    }
    
    [self.navigationController pushViewController:self.rssTableViewController animated:YES];
    
    
}

@end
