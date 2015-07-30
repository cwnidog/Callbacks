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
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] run];
  } // @autoreleasepool
  
    return 0;
} // main()
