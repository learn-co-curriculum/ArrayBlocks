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
    __block NSArray *longerNameArray;
    
    beforeEach(^{
        orderedArray = @[@1, @2, @3, @4, @5, @6];
        evenArray = @[@2, @4, @6, @8, @10];
        nameArray = @[@"Jim", @"Tom", @"Tim", @"Joe"];
        longerNameArray = [nameArray arrayByAddingObject:@"Mark"];
    });
    
    describe(@"arrayByApplyingBlock:", ^{
        
        it(@"should iterate over an array and collect the results", ^{
            
            NSArray *testArray = [orderedArray arrayByApplyingBlock:^id(id object) {
                return @([(NSNumber *)object integerValue] * 2);
            }];
            
            NSArray *simpleArray = [orderedArray arrayByApplyingBlock:^id(id object) {
                return object;
            }];
            
            NSArray *stringArray = [nameArray arrayByApplyingBlock:^id(id object) {
                return [NSString stringWithFormat:@"%@ loves to code.", object];
            }];
            
            expect(testArray).to.beAKindOf([NSArray class]);
            expect(testArray).to.equal(@[@2, @4, @6, @8, @10, @12]);
            
            expect(simpleArray).to.beAKindOf([NSArray class]);
            expect(simpleArray).to.equal(orderedArray);
            
            expect(stringArray).to.beAKindOf([NSArray class]);
            expect(stringArray).to.equal(@[@"Jim loves to code.",
                                           @"Tom loves to code.",
                                           @"Tim loves to code.",
                                           @"Joe loves to code."]);
        });
    });
    
    
    describe(@"elementsSatisfyingBlock:", ^{
        
        it(@"should return the elements for which the block returns YES", ^{
            
            NSArray *filterArray = [orderedArray elementsSatisfyingBlock:^BOOL(id object) {
                return ([object integerValue] * 2 == 10);
            }];
            
            NSArray *threeLetterNameArray = [longerNameArray elementsSatisfyingBlock:^BOOL(id object) {
                return ([object length] == 3);
            }];
            
            expect(filterArray).to.beAKindOf([NSArray class]);
            expect(filterArray).to.equal(@[@5]);

            expect(threeLetterNameArray).to.beAKindOf([NSArray class]);
            expect(threeLetterNameArray).to.equal(@[@"Jim", @"Tom", @"Tim", @"Joe"]);
        });
    });
});

SpecEnd
