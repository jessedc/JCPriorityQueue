//
//  JCSuperPriorityQueueTests.m
//  JCPriorityQueue
//
//  Created by Jesse Collis on 29/02/12.
//  Copyright (c) 2012 JC Multimedia Design. All rights reserved.
//

#import "JCSuperPriorityQueueTests.h"
#import "JCSuperPriorityQueue.h"
#import "PriotityTestObject.h"

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


- (void)testSuperPriorityQueueReturnsNilWithEmptyQueue
{
  id first = [_queue pop];
  STAssertNil(first, @"Empty Queue should return nil if empty");
}

- (void)testSuperPriorityQueueShowsCorrectFirstValueAndPopsItOff
{
  PriotityTestObject *added_first = [PriotityTestObject objectWithValue:76512];
  [_queue addObject:added_first value:added_first.value];
  
  id first = [_queue first];
  STAssertEquals(added_first, first, @"firsdt should equal first object");
  
  first = [_queue pop];
  STAssertEquals(added_first, first, @"firsdt should equal first object");
}


- (void)testSuperPriorityQueueReturnsCorrectObjectWhenZeroAddedAsSingleObject
{
  id first_object = [[[NSObject alloc] init] autorelease];
  [_queue addObject:first_object value:0];

  id first_returned = [_queue pop];
  
  STAssertEquals(first_object, first_returned, @"Adding one object then popping that object should return the same objet");
}

- (void)testSuperPriorityQueueCanHandleStandardInput
{  
  [_queue addObject:[PriotityTestObject objectWithValue:10] value:10];        //2
  [_queue addObject:[PriotityTestObject objectWithValue:15] value:15];        //3
  [_queue addObject:[PriotityTestObject objectWithValue:25] value:25];        //4
  [_queue addObject:[PriotityTestObject objectWithValue:5] value:5];          //1
  [_queue addObject:[PriotityTestObject objectWithValue:200] value:200];      //5
  [_queue addObject:[PriotityTestObject objectWithValue:95595] value:95595];  //6
  
  PriotityTestObject *popped = [_queue pop];
  
  STAssertEquals(popped.value, (NSInteger)5, nil);
  
  popped = [_queue pop];
  STAssertEquals(popped.value, (NSInteger)10, nil);
  
  popped = [_queue pop];
  STAssertEquals(popped.value, (NSInteger)15, nil);  
  
  popped = [_queue pop];
  STAssertEquals(popped.value, (NSInteger)25, nil);
  
  popped = [_queue pop];
  STAssertEquals(popped.value, (NSInteger)200, nil);

  popped = [_queue pop];
  STAssertEquals(popped.value, (NSInteger)95595, nil);
}

- (void)testSuperPriorityQueueShouldClear
{
  [_queue addObject:[PriotityTestObject objectWithValue:10] value:10];
  [_queue clear];
  
  STAssertTrue([_queue empty],@"Queue should be empty");
  
  id newObj = [PriotityTestObject objectWithValue:9001];
  [_queue addObject:newObj value:9001];
  
  id gotObj = [_queue pop];
  
  STAssertEquals(newObj, gotObj, nil);
}


@end
