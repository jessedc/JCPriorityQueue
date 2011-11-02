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


/* 
 - (void)insertObject:(id)object atIndex:(NSUInteger)idx;
 - (void)removeObjectAtIndex:(NSUInteger)idx;
 - (void)replaceObjectAtIndex:(NSUInteger)idx withObject:(id)object;
*/

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
  NSUInteger size = [[self queue] count];
  
  NSUInteger newIndex = size;
  NSUInteger parentIndex = newIndex / 2;
  
  if (parentIndex == newIndex)
  {
    [[self queue] addObject:object];
    return;
  }
  
  id<JCPriorityQueueObject> parent = [[self queue] objectAtIndex:parentIndex];
  
  while ([object value] < [parent value])
  {
    //replacing
    [[self queue] replaceObjectAtIndex:parentIndex withObject:object];
    [[self queue] insertObject:parent atIndex:newIndex];

    newIndex = parentIndex;
    parentIndex = newIndex / 2;
    
    parent = [[self queue] objectAtIndex:parentIndex];
  }
  
//  for (i = ++size; [(id<JCPriorityQueueObject>)[[self queue] objectAtIndex:i/2] value] > [object value]; i /= 2)
//  {
//    id<JCPriorityQueueObject> current = (id<JCPriorityQueueObject>)[[self queue] objectAtIndex:i/2];
//    
//    NSLog(@"i = %lu | current: %lu  object: %lu count: %lu", i, [current value], [object value], [[self queue] count]);
    
//    [[self queue] replaceObjectAtIndex:i withObject:[[self queue] objectAtIndex:i/2]];
//  }
  
  NSLog(@"Queue: %@", [self queue]);
  
  //[[self queue] replaceObjectAtIndex:i withObject:object];
}

- (id<JCPriorityQueueObject>)first;
{
  return [[self queue] objectAtIndex:0];
}

- (NSUInteger)count;
{
  return [[self queue] count];
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

