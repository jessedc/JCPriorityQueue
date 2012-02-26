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

@synthesize value = _value;

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
    _value = value;
  }
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%l", _value];
}

@end
