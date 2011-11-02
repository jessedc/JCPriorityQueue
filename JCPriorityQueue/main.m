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
        
      PriorityObject *ob1 = [[PriorityObject alloc] initWithValue:50];
      PriorityObject *ob2 = [[PriorityObject alloc] initWithValue:40];
      PriorityObject *ob3 = [[PriorityObject alloc] initWithValue:30];
      PriorityObject *ob4 = [[PriorityObject alloc] initWithValue:60];
      PriorityObject *ob5 = [[PriorityObject alloc] initWithValue:80];
      PriorityObject *ob6 = [[PriorityObject alloc] initWithValue:10];

      JCPriorityQueue *queue = [[JCPriorityQueue alloc] init];
      
//      NSMutableArray *m_array = [NSMutableArray array];
//      [m_array insertObject:ob1 atIndex:0];
//      [m_array insertObject:ob2 atIndex:3];
      
      
//      NSLog(@"%@", m_array);
      [queue addObject:ob1];
      //NSLog(@"Queue first: %lu Queue Count: %lu", [[queue first] value], [queue count]);
      //NSLog(@"Queue: %@", queue);
      
      [queue addObject:ob2];
      //NSLog(@"Queue first: %lu Queue Count: %lu", [[queue first] value], [queue count]);
      //NSLog(@"Queue: %@", queue);
      
      [queue addObject:ob3];
      ///NSLog(@"Queue first: %lu Queue Count: %lu", [[queue first] value], [queue count]);
      //NSLog(@"Queue: %@", queue);
      
      [queue addObject:ob4];
    //  NSLog(@"Queue first: %lu Queue Count: %lu", [[queue first] value], [queue count]);
      //NSLog(@"Queue: %@", queue);
      
      [queue addObject:ob5];
  //    NSLog(@"Queue first: %lu Queue Count: %lu", [[queue first] value], [queue count]);
      //NSLog(@"Queue: %@", queue);
      
      [queue addObject:ob6];
      
      [queue addObject:[[PriorityObject alloc] initWithValue:10]];
      [queue addObject:[[PriorityObject alloc] initWithValue:5]];
      [queue addObject:[[PriorityObject alloc] initWithValue:5]];
      [queue addObject:[[PriorityObject alloc] initWithValue:1]];
//      NSLog(@"Queue first: %lu Queue Count: %lu", [[queue first] value], [queue count]);
      NSLog(@"Queue: %@", queue);
      
    }
    return 0;
}

