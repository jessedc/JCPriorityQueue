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
  NSUInteger last_index = [self count];
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

- (id<JCPriorityQueueObject>)popFirst;
{
  id<JCPriorityQueueObject> first_object_to_return = [self first];
 
  NSUInteger first_index = 1;
  NSUInteger last_index = [self count] - 1;
  
  id<JCPriorityQueueObject> last_object = [self.queue objectAtIndex:last_index];
  [self.queue removeObjectAtIndex:last_index];
  
  [self.queue removeObjectAtIndex:1];
  [self.queue insertObject:last_object atIndex:1];
  
  NSUInteger i, child;
  
  for (i = first_index; i * 2 < [self count]; i = child)
  {
    child = i * 2;

    id<JCPriorityQueueObject> child_obj = [self.queue objectAtIndex:child];
    id<JCPriorityQueueObject> child_2;

    if (child + 1 < [self count])
    {
      child_2 = [self.queue objectAtIndex:child + 1];

      if (child_2.value < child_obj.value)
      {
        child++;
        child_obj = child_2;
      }
    }

    if (last_object.value > child_obj.value)
    {
      [self.queue removeObject:child_obj];
      [self.queue insertObject:child_obj atIndex:i];

      [self.queue removeObject:last_object];
      [self.queue insertObject:last_object atIndex:child];
    }
    else
    {
      break;
    }
  }

  return first_object_to_return;
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

