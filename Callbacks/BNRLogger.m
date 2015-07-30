//
//  BNRLogger.m
//  Callbacks
//
//  Created by John Leonard on 7/30/15.
//  Copyright (c) 2015 John Leonard. All rights reserved.
//

#import "BNRLogger.h"

@implementation BNRLogger

- (NSString *)lastTimeString
{
  static NSDateFormatter *dateFormatter = nil;
  
  if (!dateFormatter)
  {
    dateFormatter = [NSDateFormatter new];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    NSLog(@"Created dateFormatter.");
  }
  return [dateFormatter stringFromDate:self.lastTime];
} // lastTimeString()

- (void)updateLastTime:(NSTimer *)t
{
  NSDate *now = [NSDate date];
  [self setLastTime:now];
  NSLog(@"Just set time to %@", self.lastTimeString);
} // updateLastTime()

@end
