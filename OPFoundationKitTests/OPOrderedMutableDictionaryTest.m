//
//  OPOrderedMutableDictionaryTest.m
//  OPFoundationKit
//
//  Created by Brandon Williams on 1/8/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <GHUnitIOS/GHTestCase.h>
#import "OPOrderedMutableDictionary.h"

@interface OPOrderedMutableDictionaryTest : GHTestCase
@end

@implementation OPOrderedMutableDictionaryTest

-(void) testInsertObject {
    
    OPOrderedMutableDictionary *dict = [OPOrderedMutableDictionary new];
    
    [dict insertObject:@"a" forKey:@"0" atIndex:0];
    [dict insertObject:@"b" forKey:@"1" atIndex:1];
    [dict insertObject:@"c" forKey:@"2" atIndex:2];
    
    for (NSUInteger i = 0; i < [[dict allKeys] count]; i++)
    {
        GHAssertTrue(i == [[dict keyAtIndex:i] intValue], @"");
    }
}

-(void) testObjectForKeyAtIndex {
    
    OPOrderedMutableDictionary *dict = [OPOrderedMutableDictionary new];
    
    [dict insertObject:@"a" forKey:@"0" atIndex:0];
    [dict insertObject:@"b" forKey:@"1" atIndex:1];
    [dict insertObject:@"c" forKey:@"2" atIndex:2];
    
    for (NSUInteger i = 0; i < [[dict allKeys] count]; i++)
    {
        id obj1 = [dict objectForKeyAtIndex:i];
        id obj2 = [NSString stringWithFormat:@"%c", i+97];
        GHAssertEqualObjects(obj1, obj2, @"");
    }
}

@end
