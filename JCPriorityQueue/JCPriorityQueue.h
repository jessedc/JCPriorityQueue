//
//  JCPriorityQueue.h
//  JCPriorityQueue
//
//  Created by Jesse Collis on 10/10/11.
//  Copyright 2011 JC Multimedia Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JCPriorityQueueObject <NSObject>

@property (nonatomic, assign) NSUInteger value;

@end

@interface JCPriorityQueue : NSObject

- (void)addObject:(id<JCPriorityQueueObject>)object;
- (id<JCPriorityQueueObject>)popFirst;

- (id<JCPriorityQueueObject>)first;
- (NSUInteger)count;

@end

@interface PriorityObject : NSObject <JCPriorityQueueObject>

- (id)initWithValue:(NSUInteger)value;

@end
