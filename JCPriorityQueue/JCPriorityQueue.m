//
//  JCPriorityQueue.m
//
//  Created by Jesse Collis on 10/10/11.
//  Copyright (c) 2012, Jesse Collis JC Multimedia Design. <jesse@jcmultimedia.com.au>
//  All rights reserved.
//
//  * Redistribution and use in source and binary forms, with or without 
//   modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright 
//   notice, this list of conditions and the following disclaimer.
//
//  * Redistributions in binary form must reproduce the above copyright 
//   notice, this list of conditions and the following disclaimer in the 
//   documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY 
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND 
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
//

#import "JCPriorityQueue.h"

@implementation JCPriorityQueueHeaderNode

- (NSInteger)value
{
  return NSIntegerMin;
}

@end

@interface JCPriorityQueue()
@property (atomic, strong) NSMutableArray *queue;
@end

@implementation JCPriorityQueue

#pragma mark - Properties

@synthesize queue = _queue;

- (id)init
{
  if ((self = [super init]))
  {
    [self clear];
  }

  return self;
}

- (void)clear
{
  self.queue = [[NSMutableArray alloc] initWithObjects:[[JCPriorityQueueHeaderNode alloc] init], nil];
}

#pragma mark - JCPriorityQueue

- (void)addObject:(id<JCPriorityQueueObject>)object
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
    
    parent = [self.queue objectAtIndex:parent_index]; //re-assign parent
  }
}

- (id<JCPriorityQueueObject>)pop
{
  id<JCPriorityQueueObject> first_object_to_return = [self first];
  
  if (nil == first_object_to_return)
  {
    return nil;
  }
 
  NSUInteger first_index = 1;
  NSUInteger last_index = [self count] - 1;
  
  if (last_index == first_index)
  {
    [self.queue removeObjectAtIndex:last_index];
    return first_object_to_return;
  }
  
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

- (id<JCPriorityQueueObject>)first
{
  if (self.queue.count < 2) return nil;

  return [self.queue objectAtIndex:1];
}

- (NSUInteger)count
{
  return self.queue.count;
}

-(NSString *)description
{
  return [[self queue] description];
}

@end
