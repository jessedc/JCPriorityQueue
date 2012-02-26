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
  NSInteger _details[25];
}

@end

static const  NSInteger testData[25] = {
  10,20,40,90,100,
  320,900,657,225,854,
  1689,5465,5123,6548,0,
  63876,32656,12368,95641,5,
  -123,-12345,-123456,-987,-43};

@implementation JCPriorityQueueTests

- (void)setUp
{
  [super setUp];
  _queue = [[JCPriorityQueue alloc] init];

  memcpy(_details, testData, sizeof(testData));
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

- (void)testPriorityQueueRemovesAnItemWhenItSaysItDoes
{
  [_queue addObject:[PriotityTestObject objectWithValue:10]];
  [_queue addObject:[PriotityTestObject objectWithValue:20]];
  
  [_queue popFirst];
  
  STAssertEquals([_queue count], (NSUInteger)2, @"add two, pop one should leave a count of two (default is count of 1)");
}


- (void)testPriorityQueueReturnsCorrectObjectWhenZeroAddedAsSingleObject
{
  id first_object = [PriotityTestObject objectWithValue:0]; 
  [_queue addObject:first_object];
  
  id first_returned = [_queue popFirst];
  
  STAssertEquals(first_object, first_returned, @"Adding one object then popping that object should return the same objet");
}

- (void)testPriorityQueueHandlesANegativeValue
{
  id first_object = [PriotityTestObject objectWithValue:-49876];
  [_queue addObject:first_object];
  
  id first_returned = [_queue popFirst];
  
  STAssertEquals(first_object, first_returned, @"Adding one object then popping that object should return the same objet");
}

- (void)testPriorityQueueHandlesSinglePositiveObject
{
  id<JCPriorityQueueObject> first_object = [PriotityTestObject objectWithValue:10];
  [_queue addObject:first_object];
  
  id<JCPriorityQueueObject> first_returned = [_queue popFirst];
  
  STAssertEquals(first_object, first_returned, @"First element returned should be the same object originally added");
  STAssertEquals(first_object.value, (NSInteger)10, @"First element should be equal to the element added. Value was %d", first_returned.value);
}

- (void)testPriorityQueueHandlesAFewPredictableValues
{
  [_queue addObject:[PriotityTestObject objectWithValue:20]];
  [_queue addObject:[PriotityTestObject objectWithValue:10]];
  [_queue addObject:[PriotityTestObject objectWithValue:30]];
  [_queue addObject:[PriotityTestObject objectWithValue:40]];
  
  id <JCPriorityQueueObject> obj = [_queue popFirst];
  STAssertTrue(obj.value == 10, nil);
  
  obj = [_queue popFirst];
  STAssertTrue(obj.value == 20, nil);

  obj = [_queue popFirst];
  STAssertTrue(obj.value == 30, nil);

  obj = [_queue popFirst];
  STAssertTrue(obj.value == 40, nil);
  
  obj = [_queue popFirst];
  STAssertTrue(obj == nil, nil);
}

- (void)testPriorityQueueHandlesLotsOfRandomValues
{
  NSInteger lowest_value = NSIntegerMax;
  size_t size_of_details = sizeof(_details) / sizeof(*_details);

  srand(time(NULL));

  for (int i = 0; i < 500; i++)
  {
    int index = rand() % size_of_details;
    NSInteger value = _details[index];

    if (value < lowest_value)
    {
      lowest_value = value;
    }

    [_queue addObject:[PriotityTestObject objectWithValue:value]];
  }
  
  id<JCPriorityQueueObject> first_out = [_queue popFirst];
  
  STAssertEquals(first_out.value, lowest_value, @"Popping the first value should be equal to the lowest entered");
}

@end
