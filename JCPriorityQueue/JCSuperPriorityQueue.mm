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

  //FIXME: is it important or necessary to compare them at this poitn? 
  return false; //(unsigned) n1.obj < (unsigned) n2.obj;
}

@implementation JCSuperPriorityQueue

- (id)init
{
  if ((self = [super init]))
  {
    mCount = 0;
    mCapacity = 100;
    mObjs = (struct JCPQNode *)malloc(mCapacity * sizeof(*mObjs));
  }

  return self;
}

- (void)dealloc
{
  free(mObjs);

  [super dealloc];
}

- (void)buildHeap
{
  std::make_heap(mObjs, mObjs +mCount, NodeLessThan);
  mHeapified = YES;
}

- (unsigned)count
{
  return mCount;
}

- (void)addObject:(id)obj value:(unsigned)val
{
  mCount++;
  if (mCount > mCapacity)
  {
    mCapacity *= 2;
    mObjs = (struct JCPQNode *)realloc(mObjs, mCapacity * sizeof(*mObjs));
  }
  
  mObjs[mCount - 1].obj = obj;
  mObjs[mCount - 1].val = val;

  if (mHeapified)
  {
    std::push_heap(mObjs, mObjs + mCount, NodeLessThan);
  }
}

- (id)pop
{
  if (!mHeapified)
  {
    [self buildHeap];
  }
  
  std::pop_heap(mObjs, mObjs + mCount, NodeLessThan);
  mCount--;

  return mObjs[mCount].obj;
}

- (id)first
{
  return nil;
}

- (void)clear
{
  
}

@end
