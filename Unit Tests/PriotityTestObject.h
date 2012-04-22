//
//  PriotityTestObject.h
//  JCPriorityQueueUnitTests
//
//  Created by Jesse Collis on 26/02/12.
//  Copyright (c) 2012 JC Multimedia Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCPriorityQueue.h"

@interface PriotityTestObject : NSObject <JCPriorityQueueObject>

@property (nonatomic, assign) NSInteger cost;

+ (id)objectWithValue:(NSInteger)value;

- (id)initWithValue:(NSInteger)value;

@end
