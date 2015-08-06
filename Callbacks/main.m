//
//  main.m
//  Callbacks
//
//  Created by John Leonard on 7/30/15.
//  Copyright (c) 2015 John Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"

int main(int argc, const char *argv[]){
  @autoreleasepool
  {
    BNRLogger *logger = [BNRLogger new];
    
//    [[NSNotificationCenter defaultCenter] addObserver:logger selector:@selector(zoneChange:) name:NSSystemTimeZoneDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserverForName:NSSystemTimeZoneDidChangeNotification object:nil queue:nil usingBlock:^(NSNotification *note)
    {
      NSLog(@"The system time zone has changed!");
    } ];
    
    NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request delegate:logger startImmediately:YES];
    __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] run];
  } // @autoreleasepool
  
    return 0;
} // main()
