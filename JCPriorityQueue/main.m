//
//  main.m
//  JCPriorityQueue
//
//  Created by Jesse Collis on 10/10/11.
//  Copyright (c) 2011 JC Multimedia Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCPriorityQueue.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {

      JCPriorityQueue *queue = [[JCPriorityQueue alloc] init];
      for (int i = 0; i< 300; i++)
      {
        [queue addObject:[[PriorityObject alloc] initWithValue:50]];
        [queue addObject:[[PriorityObject alloc] initWithValue:40]];
        [queue addObject:[[PriorityObject alloc] initWithValue:60]];
        [queue addObject:[[PriorityObject alloc] initWithValue:30]];
        [queue addObject:[[PriorityObject alloc] initWithValue:80]];
        [queue addObject:[[PriorityObject alloc] initWithValue:10]];
        [queue addObject:[[PriorityObject alloc] initWithValue:5]];
        [queue addObject:[[PriorityObject alloc] initWithValue:5]];
        [queue addObject:[[PriorityObject alloc] initWithValue:1]];
      }

      for (int i = 0; i < 100; i++)
      {
        NSLog(@"%@",[queue popFirst]);
      }
      
//    NSLog(@"Queue first: %lu Queue Count: %lu", [[queue first] value], [queue count]);
//      NSLog(@"Queue: %@", queue);
//
//      [queue popFirst];
//      NSLog(@"Queue: %@", queue);
//      
//      [queue popFirst];
//      NSLog(@"Queue: %@", queue);
//      
//      [queue popFirst];
//      NSLog(@"Queue: %@", queue);      
      
    }
    return 0;
}

