//
//  JCSuperPriorityQueueTests.m
//  JCPriorityQueue
//
//  Created by Jesse Collis on 29/02/12.
//  Copyright (c) 2012 JC Multimedia Design. All rights reserved.
//

#import "JCSuperPriorityQueueTests.h"
#import "JCSuperPriorityQueue.h"

@interface JCSuperPriorityQueueTests ()
{
  JCSuperPriorityQueue *_queue;
}
@end

@implementation JCSuperPriorityQueueTests

- (void)setUp
{
  [super setUp];

  _queue = [[JCSuperPriorityQueue alloc] init];
}

- (void)tearDown
{
  [super tearDown];
  
  [_queue release];
  _queue = nil;
}

- (void)testSuperPriorityQueueCanHandleStandardInput
{
  id object = [[NSObject alloc] init];
  
  [_queue addObject:[NSNull null] value:10];
  [_queue addObject:[NSNull null] value:15];
  [_queue addObject:[NSNull null] value:20];
  [_queue addObject:object value:5];
  [_queue addObject:[NSNull null] value:200];
  [_queue addObject:[NSNull null] value:95595];
  
  id popped = [_queue pop];
  
  STAssertEquals(popped, object, nil);
}


@end
