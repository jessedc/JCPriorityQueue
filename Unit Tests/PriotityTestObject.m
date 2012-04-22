//
//  PriotityTestObject.m
//  JCPriorityQueueUnitTests
//
//  Created by Jesse Collis on 26/02/12.
//  Copyright (c) 2012 JC Multimedia Design. All rights reserved.
//

#import "PriotityTestObject.h"
#import "JCPriorityQueue.h"

@implementation PriotityTestObject

@synthesize cost = _cost;

+ (id)objectWithValue:(NSInteger)value
{
  return [[self alloc] initWithValue:value];
}

- (id)init
{
  return [self initWithValue:0];
}

- (id)initWithValue:(NSInteger)value
{
  if ((self = [super init]))
  {
    _cost = value;
  }
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%d", _cost];
}

@end
