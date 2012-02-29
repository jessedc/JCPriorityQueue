//
//  JCSuperPriorityQueue.h
//
//  Created by Jesse Collis on 28/02/12.
//  Copyright (c) 2012 JC Multimedia Design. All rights reserved.
//
//  Original code and learnings inspired by Mike Ash (http://www.mikeash.com/pyblog/using-evil-for-good.html)


#import <Foundation/Foundation.h>

@interface JCSuperPriorityQueue : NSObject {
  struct JCPQNode * mObjs;
  unsigned          mCount;
  unsigned          mCapacity;
  BOOL              mHeapified;
}

- (void)addObject:(id)obj value:(unsigned)value;
- (id)pop;
- (id)first; //does not pop

- (unsigned)count;
- (bool)empty;

- (void)clear;

@end
