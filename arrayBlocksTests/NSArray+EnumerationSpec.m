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
    __block NSPredicate *evenPredicate;
    
    
    
    
    //    NSArray *testArray = @[@1,@2,@3,@4,@5];
    //
    //    NSArray *resultsArray = [testArray mapWithOperation:^id(id object) {
    //        return @([(NSNumber *)object integerValue] + 1);
    //    }];
    //
    //    NSLog(@"resultsArray: %@",resultsArray);
    //
    //
    //    NSLog(@"enumerateObjectsUsingBlock:");
    //    [testArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    //        NSLog(@"%@",@([(NSNumber *)obj integerValue] + 1));
    //    }];
    //
    //
    //    NSArray *filteredResultsArray = [resultsArray selectWithComparator:^BOOL(id object) {
    //
    //        if ([object integerValue]%2 == 0)
    //        {
    //            return YES;
    //        }
    //        else
    //        {
    //            return NO;
    //        }
    //    }];
    //
    //    NSLog(@"filteredResultsArray: %@", filteredResultsArray);
    //
    //    NSPredicate *evenPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings){
    //        return ([evaluatedObject integerValue]%2 == 0);
    //    }];
    //
    //    NSArray *filteredResultsArrayTwo = [resultsArray filteredArrayUsingPredicate:evenPredicate];
    //
    //    NSLog(@"filteredResultsArrayTwo: %@",filteredResultsArrayTwo);
    
    
    //    - (NSArray *)mapWithOperation:(id (^) (id object))operation;
    //    - (NSArray *)selectWithComparator:(BOOL (^) (id object))operation;
    
    beforeAll(^{
        
    });
    
    beforeEach(^{
        orderedArray = @[@1, @2, @3, @4, @5, @6];
        evenArray = @[@2, @4, @6, @8, @10];
        evenPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings){
            return ([evaluatedObject integerValue] % 2 == 0);
        }];
    });
    
    describe(@"mapWithOperation:", ^{
        
        it(@"It should iterate over an array similiar to the enumerateObjectsUsingBlock: method and return a NSArray which will iterate over the array, increase the NSNumber stored in the array by 1.", ^{
            
            NSArray *newArray = [orderedArray mapWithOperation:^id(id object) {
                
                return @[@"Hi"];
//                return @([(NSNumber *)object integerValue] + 1);
            }];
            
            expect(newArray).to.beAKindOf([NSArray class]);
            expect([newArray count]).to.equal([orderedArray count]);
            expect(newArray).to.equal(@[@2, @3, @4, @5, @6, @7]);
            expect(newArray).toNot.equal(@[@1, @2, @3, @4, @5, @6]);
            
            
            
            
            
            
//            - (NSArray *)mapWithOperation:(id (^) (id object))operation {
//                
//                NSMutableArray *processingArray = [[NSMutableArray alloc] init];
//                
//                for (id object in self)
//                {
//                    [processingArray addObject:operation(object)];
//                }
//                
//                return processingArray;
            
            
            
            
        });
        
        
        
        
        
        
    });
    
    
    it(@"", ^{
        
    });  
    
    afterEach(^{
        
    });
    
    afterAll(^{
        
    });
});

SpecEnd
