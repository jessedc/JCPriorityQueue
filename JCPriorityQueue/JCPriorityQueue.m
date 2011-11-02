//
//  JCPriorityQueue.m
//  JCPriorityQueue
//
//  Created by Jesse Collis on 10/10/11.
//  Copyright 2011 JC Multimedia Design. All rights reserved.
//

#import "JCPriorityQueue.h"

@interface JCPriorityQueue()

@property (atomic, strong) NSMutableOrderedSet *queue;

@end

@implementation JCPriorityQueue

#pragma mark - Properties

@synthesize queue = queue_;

- (id)init;
{
  if ((self = [super init]))
  {
    NSMutableOrderedSet *new_set = [[NSMutableOrderedSet alloc] init];
    [new_set addObject:[[PriorityObject alloc] init]];
    self.queue = new_set;
  }

  return self;
}

#pragma mark - JCPriorityQueue

- (void)addObject:(id<JCPriorityQueueObject>)object;
{  
  NSUInteger last_index = self.queue.count;
  NSUInteger parent_index = last_index / 2;

  [self.queue addObject:object];
  
  id<JCPriorityQueueObject> parent = [self.queue objectAtIndex:parent_index];
  
  while (object.value < parent.value) //compare with parent
  {
    [self.queue removeObject:object];
    [self.queue insertObject:object atIndex:parent_index];
    
    [self.queue removeObject:parent];
    [self.queue insertObject:parent atIndex:last_index]; //swap
    
    last_index = parent_index; //increment
    parent_index /= 2;
    
    parent = [self.queue objectAtIndex:parent_index]; //reasign parent
  }
  
  
}

- (id<JCPriorityQueueObject>)first;
{
  NSAssert(self.queue.count > 1, @"Queue is Empty");

  return [self.queue objectAtIndex:1];
}

- (NSUInteger)count;
{
  return self.queue.count;
}

-(NSString *)description;
{
  return [[self queue] description];
}

@end

#pragma mark - PriorityObject

@implementation PriorityObject

@synthesize value = value_;

- (id)init;
{
  return [self initWithValue:0];
}

- (id)initWithValue:(NSUInteger)value;
{
  if ((self = [super init]))
  {
    value_ = value;
  }
  return self;
}

- (NSString *)description;
{
  return [NSString stringWithFormat:@"%lu",value_];
}

@end

