//
//  AppDelegate.m
//  ExpandTableView
//
//  Created by andyzhang on 13-7-15.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import "AppDelegate.h"
#import "Quotation.h"
#import "Play.h"
#import "ExpandTableViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSArray *playsArray = [self getPlayFromFile];
    ExpandTableViewController *expandTableView = (ExpandTableViewController *)self.window.rootViewController;
    expandTableView.playsArray = playsArray;
    return YES;
}
							
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
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (NSArray *)getPlayFromFile
{
    NSURL *playUrl = [[NSBundle mainBundle] URLForResource:@"PlaysAndQuotations" withExtension:@"plist"];
    //NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:playUrl];
    NSArray *playsArr = [NSArray arrayWithContentsOfURL:playUrl];
    NSMutableArray *plays = [NSMutableArray array];
    for (int i=0;i<playsArr.count;i++ ) {
        Play *play = [[Play alloc] init];
        NSDictionary *playDict = playsArr[i];
        NSString *playName = [playDict objectForKey:@"playName"];
        play.playName = playName;
        
        NSArray *quotationArr = [playDict objectForKey:@"quotations"];
        NSMutableArray *quotations = [NSMutableArray array];
        for (NSDictionary *quotationDict in quotationArr) {
            int act =[[quotationDict objectForKey:@"act"] intValue];
            int scene = [[quotationDict objectForKey:@"scene"] intValue];
            NSString *character = [quotationDict objectForKey:@"character"];
            NSString *quotation = [quotationDict objectForKey:@"quotation"];
            
            Quotation *q = [[Quotation alloc] init];
            q.act = act;
            q.scene = scene;
            q.character = character;
            q.quotation = quotation;
            
            [quotations addObject:q];
        }
        play.quotations = quotations;
        
        [plays addObject:play];
    }
    
    NSLog(@"plays==%@",plays);
    return plays;
}
@end
