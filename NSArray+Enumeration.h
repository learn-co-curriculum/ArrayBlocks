//
//  NSArray+Enumeration.h
//  arrayBlocks
//
//  Created by Zachary Drossman on 10/29/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Enumeration)

- (NSArray *)mapWithOperation:(id (^) (id object))operation;
- (NSArray *)selectWithComparitor:(BOOL (^) (id object))operation;

@end
