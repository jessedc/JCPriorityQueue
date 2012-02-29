//
//  JCSuperPriorityQueue.mm
//  JCPriorityQueue
//
//  Created by Jesse Collis on 28/02/12.
//  Copyright (c) 2012 JC Multimedia Design. All rights reserved.
//

#import "JCSuperPriorityQueue.h"
#import <algorithm>

struct JCPQNode {
  id obj;
  unsigned val;
};

static bool NodeLessThan(struct JCPQNode &n1, struct JCPQNode &n2)
{
  if (n1.val != n2.val)
  {
    return n1.val > n2.val;
  }

  //FIXME: is it important or necessary to compare them at this point? 
  return false; //(unsigned) n1.obj < (unsigned) n2.obj;
}

@implementation JCSuperPriorityQueue

- (id)init
{
  if ((self = [super init]))
  {
    //TODO: Optimise the allocation
    mCapacity = 100;
    mObjs = (struct JCPQNode *)malloc(mCapacity * sizeof(*mObjs));
    
    [self clear];
  }

  return self;
}

- (void)dealloc
{
  free(mObjs);

  [super dealloc];
}

- (void)clear
{
  mCount = 0;
  std::make_heap(mObjs, mObjs + mCount, NodeLessThan);
  mHeapified = YES;  
}

- (unsigned)count
{
  return mCount;
}

- (bool)empty
{
  return (mCount < 1);
}

- (void)addObject:(id)obj value:(unsigned)val
{
  if (!mHeapified) return;

  mCount++;
  
  if (mCount > mCapacity)
  {
    mCapacity *= 2;
    mObjs = (struct JCPQNode *)realloc(mObjs, mCapacity * sizeof(*mObjs));
  }
  
  mObjs[mCount - 1].obj = obj;
  mObjs[mCount - 1].val = val;

  std::push_heap(mObjs, mObjs + mCount, NodeLessThan);
}

- (id)pop
{
  if ([self empty]) return nil;

  std::pop_heap(mObjs, mObjs + mCount, NodeLessThan);
  mCount--;

  return mObjs[mCount].obj;
}

- (id)first
{
  if ([self empty]) return nil;
  
  return mObjs[0].obj;
}

@end
