//
//  NSArray+Enumeration.m
//  arrayBlocks
//
//  Created by Zachary Drossman on 10/29/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "NSArray+Enumeration.h"

@implementation NSArray (Enumeration)

- (NSArray *)mapWithOperation:(id (^) (id object))operation {
    
    NSMutableArray *processingArray = [[NSMutableArray alloc] init];
    
    for (id object in self)
    {
        [processingArray addObject:operation(object)];
    }
    
    return processingArray;
    
}

- (NSArray *)selectWithComparator:(BOOL (^) (id object))operation {
    
    NSMutableArray *processingArray = [[NSMutableArray alloc] init];
    
    for (id object in self)
    {
        if (operation(object)) {
            [processingArray addObject:object];
        }
    }
    
    return processingArray;
}
@end
