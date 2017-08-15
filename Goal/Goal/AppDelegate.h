//
//  AppDelegate.h
//  Goal
//
//  Created by Mani Batra on 03/02/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

extern NSString *const FBSessionStateChangedNotification;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) NSURL *openedURL;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI;
-(void)closeSession;
-(void)sendRequest:(id<FBGraphUser>)recepient;
-(void)checkIncomingNotification;

@end
