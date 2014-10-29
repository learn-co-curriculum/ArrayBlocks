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
    
    for (NSInteger i = 0; i < [self count]; i++)
    {
        [processingArray addObject:operation(self[i])];
    }
    
    return processingArray;
    
}

- (NSArray *)selectWithComparitor:(BOOL (^) (id object))operation {
    
    NSMutableArray *processingArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < [self count]; i++)
    {
        if (operation(self[i])) {
            [processingArray addObject:self[i]];
        }
    }
    
    return processingArray;
}
@end
