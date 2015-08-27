//
//  NSArray+EnumerationSpec.m
//  arrayBlocks
//
//  Created by James Campagno on 8/27/15.
//  Copyright 2015 Zachary Drossman. All rights reserved.
//

#import "Specta.h"
#import "NSArray+Enumeration.h"
#import "Expecta.h"
#define EXP_SHORTHAND


SpecBegin(NSArray)

describe(@"NSArray+Enumeration", ^{
    
    __block NSArray *orderedArray;
    __block NSArray *evenArray;
    __block NSArray *nameArray;
    
    beforeEach(^{
        orderedArray = @[@1, @2, @3, @4, @5, @6];
        evenArray = @[@2, @4, @6, @8, @10];
        nameArray = @[@"Jim", @"Tom", @"Tim", @"Joe"];
    });
    
    describe(@"mapWithOperation:", ^{
        
        it(@"Should iterate over an array similiar to the enumerateObjectsUsingBlock: method and return a NSArray.  The argument being a block should be called correctly within the implementation of the mapWithOperation method doing what it's expected to do, then returning a NSArray object after having performed what has been defined/returned from the block.", ^{
            
            NSArray *testArray = [orderedArray mapWithOperation:^id(id object) {
                return @([(NSNumber *)object integerValue] * 2);
            }];
            
            NSArray *simpleArray = [orderedArray mapWithOperation:^id(id object) {
                return object;
            }];
            
            NSArray *stringArray = [nameArray mapWithOperation:^id(id object) {
                return [NSString stringWithFormat:@"%@ loves to code.", object];
            }];
            
            expect(testArray).to.beAKindOf([NSArray class]);
            expect([testArray count]).to.equal([orderedArray count]);
            expect(testArray).to.equal(@[@2, @4, @6, @8, @10, @12]);
            expect(testArray).toNot.equal(@[@1, @2, @3, @4, @5, @6]);
            
            expect(simpleArray).to.beAKindOf([NSArray class]);
            expect([simpleArray count]).to.equal([orderedArray count]);
            expect(simpleArray).to.equal(orderedArray);
            
            expect(stringArray).to.beAKindOf([NSArray class]);
            expect([stringArray count]).to.equal([nameArray count]);
            expect(stringArray).to.equal(@[@"Jim loves to code.",
                                           @"Tim loves to code.",
                                           @"Tom loves to code.",
                                           @"Joe loves to code."]);
            expect(stringArray).toNot.equal(@[@"Jim", @"Tom", @"Tim", @"Joe"]);
        });
    });
    
    
    describe(@"selectWithComparator:", ^{
        
        it(@"Should iterate over an array similiar to the predicateWithBlock: method and return a NSArray.  The argument here is a block which will return a BOOL evaluating the object in self (self being the array calling this method.  The new array will be filetered based upon the impleentation of this method and how it handles the YES/NO being returned.", ^{
           
           
           
           
           
           
//            NSArray *filteredResultsArray = [resultsArray selectWithComparator:^BOOL(id object) {
//                
//                if ([object integerValue]%2 == 0)
//                {
//                    return YES;
//                }
//                else
//                {
//                    return NO;
//                }
//            }];

           
           
           
           
           });
        
        
    });
    
    
    
    
//    - (NSArray *)selectWithComparator:(BOOL (^) (id object))operation {
//        
//        NSMutableArray *processingArray = [[NSMutableArray alloc] init];
//        
//        for (id object in self)
//        {
//            if (operation(object)) {
//                [processingArray addObject:object];
//            }
//        }
//        
//        return processingArray;
//    }
    
    
    
    
    
});

SpecEnd
