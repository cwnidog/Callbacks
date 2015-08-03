//
//  BNRLogger.m
//  Callbacks
//
//  Created by John Leonard on 7/30/15.
//  Copyright (c) 2015 John Leonard. All rights reserved.
//

#import "BNRLogger.h"

@implementation BNRLogger

// Called each time a chunk of data arrives
- (void)connection:(NSURLConnection*) connection didReceiveData:(NSData *)data
{
  NSLog(@"received %lu bytes", [data length]);
  
  // create mutable data if it doesn't already exist
  if (!_incomingData)
  {
    _incomingData = [NSMutableData new];
  }
  
  [_incomingData appendData:data];
} // connection didReceiveData

// Called when the last chunk has been processed
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
  NSLog(@"Got it all!");
  NSString *string = [[NSString alloc] initWithData:_incomingData encoding:NSUTF8StringEncoding];
  
  _incomingData = nil;
  NSLog(@"The string has %lu characters", [string length]);
  
  // Uncomment the next line to see the entire fetched file
  // NSLog(@"The whole string is %@", string); <- checked it, it works
  
} // connectionDidFinishLoading()

// Called if the fetch fails
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
  NSLog(@"Connection failed %@", [error localizedDescription]);
  _incomingData = nil;
} // connection didFailWithError

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
