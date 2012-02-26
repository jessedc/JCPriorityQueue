//
//  Unit_Tests.m
//  Unit Tests
//
//  Created by Jesse Collis on 26/02/12.
//  Copyright (c) 2012 JC Multimedia Design. All rights reserved.
//

#import "JCPriorityQueueTests.h"
#import "JCPriorityQueue.h"
#import "PriotityTestObject.h"

@interface JCPriorityQueueTests (){
  JCPriorityQueue *_queue;
  NSInteger *_details;
}

@end

@implementation JCPriorityQueueTests

- (void)setUp
{
  [super setUp];
  _queue = [[JCPriorityQueue alloc] init];
  
  NSInteger some_data[20] = {
    10,20,40,90,100,
    320,900,657,225,854,
    1689,5465,5123,6548,0,
    63876,32656,12368,95641,5 };
  
  _details = some_data;
}

- (void)tearDown
{
  [super tearDown];
  
  _queue = nil;
}

- (void)testPriorityQueueReturnsNilWithEmptyQueue
{
  id<JCPriorityQueueObject> first = [_queue popFirst];
  STAssertNil(first,@"Empty Queue should return nil if empty");
}

- (void)testPriorityQueueReturnsCorrectObjectWhenZeroAddedAsSingleObject
{
  id first_object = [PriotityTestObject objectWithValue:0]; 
  [_queue addObject:first_object];
  
  id first_returned = [_queue popFirst];
  
  STAssertEquals(first_object, first_returned, @"Adding one object then popping that object should return the same objet");
}

- (void)testPriorityQueueManagesNegativeValues
{
  id first_object = [PriotityTestObject objectWithValue:-49876];
  [_queue addObject:first_object];
  
  id first_returned = [_queue popFirst];
  
  STAssertEquals(first_object, first_returned, @"Adding one object then popping that object should return the same objet");
}

- (void)testPriorityQueueHandlesSingleObjectNotZero
{
  id<JCPriorityQueueObject> first_object = [PriotityTestObject objectWithValue:10];
  [_queue addObject:first_object];
  
  id<JCPriorityQueueObject> first_returned = [_queue popFirst];
  
  STAssertEquals(first_object, first_returned, @"First element returned should be the same object originally added");
  STAssertEquals(first_object.value, (NSInteger)10, @"First element should be equal to the element added. Value was %d", first_returned.value);
}

@end
