//
//  BNRLogger.h
//  Callbacks
//
//  Created by John Leonard on 7/30/15.
//  Copyright (c) 2015 John Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRLogger : NSObject

@property (nonatomic) NSDate *lastTime;

- (NSString *)lastTimeString;

- (void)updateLastTime: (NSTimer *)t;

@end // interface BNRLogger
