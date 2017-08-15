//
//  AppDelegate.m
//  Goal
//
//  Created by Mani Batra on 03/02/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "AppDelegate.h"

#import "MasterViewController.h"
#import "HomePageViewController.h"
#import "FBSBJSON.h"

NSString *const FBSessionStateChangedNotification=@"com.mani.Goal:FBSessionStateChangedNotification";

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize openedURL=_openedURL;



-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    self.openedURL=url;
    NSLog(@"%@",self.openedURL);

    return [FBSession.activeSession handleOpenURL:url];
    
}

    //Helper function to check the incoming URL

-(void)checkIncomingNotification{
    
    NSLog(@"Checking for notificataion");
    
    if (self.openedURL) {
        
        NSLog(@"I am herer with %@",self.openedURL);
        
        
        
        NSString *query=[self.openedURL fragment];
        if(!query){
            
            query=[self.openedURL query];
            
        }
        
        NSDictionary *params=[self parseURLParams:query];
        
        //Check if hte target URL exists
        
        NSString *targetURLString=[params valueForKey:@"target_url"];
        
        if (targetURLString) {
            
            NSLog(@"Found the target URL Striung");
            
            NSURL *targetURL=[NSURL URLWithString:targetURLString];
            
            NSDictionary *targetParams=[self parseURLParams:[targetURL query]];
            
            NSString *ref=@"notif";
            //[targetParams valueForKey:@"ref"];
            
            
            NSLog(@"%@ WOWWWW!!!", ref);
            //Check if the ref is a notification
            
            if ([ref isEqualToString:@"notif"]) {
                
                NSLog(@"Found a notification");
                
                NSString *requestIDParam=[targetParams objectForKey:@"request_ids"];
                
                NSArray *requestIDs=[requestIDParam componentsSeparatedByString:@","];
                
                [self notificationGet:@"4696884264197"];
                
            }
            
            
        }
        
        //Cleaning out to avoid duplicate calls
       // self.openedURL=nil;
        
        
        
    }


}

//Helper fuction to get the request data

-(void) notificationGet:(NSString*) requestid{
    
    NSLog(@"About to show the notification");
    
    [FBRequestConnection startWithGraphPath:requestid completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        
        if (!error) {
            
            NSString *title;
            NSString *message;
            
            if ([result objectForKey:@"data"]) {
                
                title=[NSString stringWithFormat:@" %@ sent you the request",[[result objectForKey:@"from"]objectForKey:@"name"]];
                
                FBSBJSON *jsonParser=[FBSBJSON new];
                NSDictionary *requestData=[jsonParser objectWithString:[result objectForKey:@"data"]];
                
                message=[NSString stringWithFormat:@"%@", [requestData objectForKey:@"request"]];
                
                NSLog(@"AND THE MESSAGE IS : %@",message);
                
                
            }else {
                    title = [NSString
                             stringWithFormat:@"%@ sent you a request",
                             [[result objectForKey:@"from"] objectForKey:@"name"]];
                    message = [NSString stringWithString:
                               [result objectForKey:@"message"]];
                
                NSLog(@"AND THE MESSAGE IS : %@",message);
                
            }
            
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:title
                                  message:message
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil,
                                  nil];
            [alert show];
            
            // Delete the request notification
            [self notificationClear:[result objectForKey:@"id"]];
            
        }else{
            
            
            NSLog(@"%@", error.localizedDescription);
            
        }
        
    }];
    
}

//Helper function to delete the request

-(void)notificationClear:(NSString*)requestid{
    
    // Delete the request notification
    [FBRequestConnection startWithGraphPath:requestid
                                 parameters:nil
                                 HTTPMethod:@"DELETE"
                          completionHandler:^(FBRequestConnection *connection,
                                              id result,
                                              NSError *error) {
                              if (!error) {
                                  NSLog(@"Request deleted");
                              }
                          }];
    
    
}

-(void) sesssionStateChanged:(FBSession*)session state:(FBSessionState) state error:(NSError*) error{
    
    
    switch (state) {
        case FBSessionStateOpen:
            if (!error) {
                
                NSLog(@"User Session Found");
                
            }
            break;
        case FBSessionStateClosed:
        case FBSessionStateClosedLoginFailed:
            [FBSession.activeSession closeAndClearTokenInformation];
            break;
            
        default:
            break;
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FBSessionStateChangedNotification object:session];
    
    if (error) {
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
        
    }
    
    
}


-(BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI{
    
    return [FBSession openActiveSessionWithReadPermissions:nil allowLoginUI:allowLoginUI completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
        
        [self sesssionStateChanged:session state:state error:error];
        
        
        
    }];
    
    
}

-(void) closeSession{
    
    [FBSession.activeSession closeAndClearTokenInformation];
    
}


//parsing incoming URL requests
-(NSDictionary*)parseURLParams:(NSString*)query{
    
    NSArray *pairs=[query componentsSeparatedByString:@"&"];
    NSMutableDictionary* params=[[NSMutableDictionary alloc] init];
    
    for (NSString* pair in pairs) {
        
        NSArray* kv=[pair componentsSeparatedByString:@"="];
        NSLog(@"FOR OBJECT : %@", [kv objectAtIndex:0]);
        //NSLog(@"the value is : %@",[kv objectAtIndex:1]);
        if ([[kv objectAtIndex:0] isEqualToString:@"request_ids"]) {
            
            [params setValue:@"4696884264197" forKey:@"request_ids"];
            
        }else{
        NSString* val=[[kv objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [params setValue:val forKey:[kv objectAtIndex:0]];
            
        }
        
        
    }
    
    return params;
    
}

//Sending the request to a targeted user
-(void)sendRequest:(id<FBGraphUser>)recepient{
    
    FBSBJSON *jsonWriter=[FBSBJSON new];
    NSDictionary *request=[NSDictionary dictionaryWithObjectsAndKeys:@"Please swipe my card", @"request", nil];
    
    NSString *requestStr=[jsonWriter stringWithObject:request];
    
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithObjectsAndKeys:requestStr,@"data", nil];
    
    NSLog(@"Till here");
    [params setValue:recepient.id forKey:@"to"];
    
    //Displaying the rquest dialog
    [FBWebDialogs presentRequestsDialogModallyWithSession:nil message:@"This is going to be epic" title:nil parameters:params handler:^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
        
        if (error) {
            
            NSLog(@"Error sending requests");
            
        }else{
            
            if (result==FBWebDialogResultDialogNotCompleted) {
                
                NSLog(@"User cancelled the rquest by clicking the 'x' ");
                
            }else{
                
                NSDictionary *urlParams=[self parseURLParams:[resultURL query]];
                if(![urlParams valueForKey:@"request"]){
                    
                    NSLog(@"User clicked the cancel button");
                    
                }else{
                    
                    NSString *requestID=[urlParams valueForKey:@"request"];
                    NSLog(@"The rquest was sent with id : %@", requestID);
                    
                }
                
            }
            
            
        }
        
    }];
    
}

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
////    NSManagedObjectContext *context=[self managedObjectContext];
////    NSFetchRequest *request=[[NSFetchRequest alloc] init];
////    [request setEntity:[NSEntityDescription entityForName:@"Goals" inManagedObjectContext:context]];
////    [request setIncludesSubentities:NO];
////    
////    NSError *error;
////    int count=[context countForFetchRequest:request error:&error];
////    
////    if(count==0){
////        
////        self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
////        UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
////        
////        self.noGoal=[storyboard instantiateViewControllerWithIdentifier:@"NOGOAL"];
////        
////        self.window.rootViewController=self.noGoal;
////        [self.window makeKeyAndVisible];
////        
////        
////        
////    }else{
//    // Override point for customization after application launch.
//    //UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
//    
//    //HomePageViewController *homePage=(HomePageViewController*)navigationController.topViewController;
//
////    MasterViewController *controller = (MasterViewController *)navigationController.topViewController;
////    controller.managedObjectContext = self.managedObjectContext;
//    
////    }
//    
//    NSLog(@"%@",[launchOptions valueForKey:UIApplicationLaunchOptionsURLKey]);
//    
//    NSLog(@"%@", self.openedURL);
//    
//    return YES;
//}


							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
   [FBSession.activeSession handleDidBecomeActive];
    
    if (FBSession.activeSession.isOpen) {
        // Check for any incoming notifications
        [self checkIncomingNotification];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    
    [FBSession.activeSession close];
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Goal" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Goal.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
