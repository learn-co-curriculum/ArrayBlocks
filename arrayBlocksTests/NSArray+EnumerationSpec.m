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
            expect(testArray).toNot.equal(@[]);

            
            expect(simpleArray).to.beAKindOf([NSArray class]);
            expect([simpleArray count]).to.equal([orderedArray count]);
            expect(simpleArray).to.equal(orderedArray);
            expect(simpleArray).toNot.equal(@[]);

            
            expect(stringArray).to.beAKindOf([NSArray class]);
            expect([stringArray count]).to.equal([nameArray count]);
            expect(stringArray).to.equal(@[@"Jim loves to code.",
                                           @"Tom loves to code.",
                                           @"Tim loves to code.",
                                           @"Joe loves to code."]);
            expect(stringArray).toNot.equal(@[@"Jim", @"Tom", @"Tim", @"Joe"]);
            expect(stringArray).toNot.equal(@[]);
        });
    });
    
    
    describe(@"selectWithComparator:", ^{
        
        it(@"Should iterate over an array similiar to the predicateWithBlock: method and return a NSArray.  The argument here is a block which will return a BOOL evaluating the object in self (self being the array calling this method).  The new array will be filetered based upon the impleentation of this method and how it handles the YES/NO being returned.", ^{
           
           NSArray *filterArray = [orderedArray selectWithComparator:^BOOL(id object) {
               return ([object integerValue] * 2 == 10);
           }];
            
            NSArray *threeLetterNameArray = [nameArray selectWithComparator:^BOOL(id object) {
                return ([object length] == 3);
            }];
            
            expect(filterArray).to.beAKindOf([NSArray class]);
            expect([filterArray count]).to.equal(1);
            expect(filterArray).to.equal(@[@5]);
            expect(filterArray).toNot.equal(@[@1, @2, @3, @4, @5, @6]);
            expect(filterArray).toNot.equal(@[]);

            expect(threeLetterNameArray).to.beAKindOf([NSArray class]);
            expect([threeLetterNameArray count]).to.equal(4);
            expect(threeLetterNameArray).to.equal(@[@"Jim", @"Tom", @"Tim", @"Joe"]);
            expect(threeLetterNameArray).toNot.equal(@[]);
           });
    });
});

SpecEnd
