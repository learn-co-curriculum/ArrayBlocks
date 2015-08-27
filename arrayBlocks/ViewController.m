//
//  ViewController.m
//  arrayBlocks
//
//  Created by Zachary Drossman on 10/29/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Enumeration.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *testArray = @[@1,@2,@3,@4,@5];
    
    NSArray *resultsArray = [testArray mapWithOperation:^id(id object) {
        return @([(NSNumber *)object integerValue] + 1);
    }];
    
    NSLog(@"resultsArray: %@",resultsArray);

    
    NSLog(@"enumerateObjectsUsingBlock:");
    [testArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@",@([(NSNumber *)obj integerValue] + 1));
    }];
    
    
    NSArray *filteredResultsArray = [resultsArray selectWithComparator:^BOOL(id object) {
        
        if ([object integerValue]%2 == 0)
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }];
    
    NSLog(@"filteredResultsArray: %@", filteredResultsArray);
    
    NSPredicate *evenPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings){
        return ([evaluatedObject integerValue]%2 == 0);
    }];
    
    NSArray *filteredResultsArrayTwo = [resultsArray filteredArrayUsingPredicate:evenPredicate];
    
    NSLog(@"filteredResultsArrayTwo: %@",filteredResultsArrayTwo);

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
