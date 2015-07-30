//
//  AppDelegate.m
//  XMPPTestDemo
//
//  Created by gwchina on 15/4/10.
//  Copyright (c) 2015年 绿网天下. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

//@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//
//- (void)saveContext;
//- (NSURL *)applicationDocumentsDirectory;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"LynjayDatabase.sqlite"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[ViewController alloc] init];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];


    
    // Saves changes in the application's managed object context before the application terminates.
//    [self saveContext];
    
    return YES;
}

//- (void)saveContext
//{
//    NSError *error = nil;
//    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
//    if (managedObjectContext != nil)
//    {
////        if ([managedObjectContext hasChanges] &amp;&amp; ![managedObjectContext save:&amp;error])
//        if ([managedObjectContext hasChanges] &amp;&amp; ![managedObjectContext save]) {
//            <#statements#>
//        }
//        {
//            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//            abort();
//        }
//    }
//}
//
//#pragma mark - Core Data stack
//
///**
// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
// */
//- (NSManagedObjectContext *)managedObjectContext
//{
//    if (__managedObjectContext != nil)
//    {
//        return __managedObjectContext;
//    }
//    
//    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
//    if (coordinator != nil)
//    {
//        __managedObjectContext = [[NSManagedObjectContext alloc] init];
//        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
//    }
//    return __managedObjectContext;
//}
//
///**
// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
// */
//- (NSManagedObjectModel *)managedObjectModel
//{
//    if (__managedObjectModel != nil)
//    {
//        return __managedObjectModel;
//    }
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"blaba" withExtension:@"momd"];
//    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
//    return __managedObjectModel;
//}
//
///**
// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
// */
//- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
//{
//    if (__persistentStoreCoordinator != nil)
//    {
//        return __persistentStoreCoordinator;
//    }
//    
//    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"blaba.sqlite"];
//    
//    NSError *error = nil;
//    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
//    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&amp;error])
//    {
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        abort();
//    }
//    
//    return __persistentStoreCoordinator;
//}
//
//#pragma mark - Application's Documents directory
//
///**
// Returns the URL to the application's Documents directory.
// */
//- (NSURL *)applicationDocumentsDirectory
//{
//    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
//}


//- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
//
//{
//    
//    if (_persistentStoreCoordinator != nil) {
//        
//        return _persistentStoreCoordinator;
//        
//    }
//    
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    NSString *folderPath = [NSString stringWithFormat:@"%@/Calendar",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]];
//    
//    if(![fileManager fileExistsAtPath:folderPath]){//如果不存在,则说明是第一次运行这个程序，那么建立这个文件夹
//        
//        [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
//        
//    }
//    
//    NSURL *storeURL = [NSURL fileURLWithPath:[folderPath stringByAppendingPathComponent:@"Calendar.sqlite"]];
//    
//    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
//                             
//                             [NSNumber numberWithBool:YES],
//                             
//                             NSMigratePersistentStoresAutomaticallyOption，
//                             
//                             [NSNumber numberWithBool:YES],
//                             
//                             NSInferMappingModelAutomaticallyOption, nil];
//    
//    NSError *error = nil;
//    
//    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
//    
//    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
//        
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        
//        abort();
//        
//    }
//    
//    return _persistentStoreCoordinator;
//    
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [MagicalRecord cleanUp];
}

@end
