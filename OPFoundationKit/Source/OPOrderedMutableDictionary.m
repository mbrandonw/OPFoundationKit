//
//  OPOrderedMutableDictionary.m
//  OPFoundationKit
//
//  Created by Brandon Williams on 1/2/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "OPOrderedMutableDictionary.h"

NSString *DescriptionForObject(NSObject *object, id locale, NSUInteger indent);

@implementation OPOrderedMutableDictionary {
	NSMutableDictionary *dictionary;
	NSMutableArray *array;
}

-(id) init {
	return [self initWithCapacity:0];
}

-(id) initWithCapacity:(NSUInteger)capacity {
	if (! (self = [super init]))
        return nil;
    
    dictionary = [[NSMutableDictionary alloc] initWithCapacity:capacity];
    array = [[NSMutableArray alloc] initWithCapacity:capacity];
    
	return self;
}

-(id) copy {
	return [self mutableCopy];
}

-(void) setObject:(id)anObject forKey:(id)aKey {
    
	if (![dictionary objectForKey:aKey])
		[array addObject:aKey];
    
	[dictionary setObject:anObject forKey:aKey];
}

-(void) removeObjectForKey:(id)aKey {
    
	[dictionary removeObjectForKey:aKey];
	[array removeObject:aKey];
}

-(NSUInteger) count {
	return [dictionary count];
}

-(id) objectForKey:(id)aKey {
	return [dictionary objectForKey:aKey];
}

-(NSEnumerator*) keyEnumerator {
	return [array objectEnumerator];
}

-(NSEnumerator*) reverseKeyEnumerator {
	return [array reverseObjectEnumerator];
}

-(void) insertObject:(id)anObject forKey:(id)aKey atIndex:(NSUInteger)anIndex {
    
	if (![dictionary objectForKey:aKey])
		[self removeObjectForKey:aKey];
    
	[array insertObject:aKey atIndex:anIndex];
	[dictionary setObject:anObject forKey:aKey];
}

-(id) keyAtIndex:(NSUInteger)anIndex {
	return [array objectAtIndex:anIndex];
}

-(id) objectForKeyAtIndex:(NSUInteger)anIndex {
    return [dictionary objectForKey:[self keyAtIndex:anIndex]];
}

-(NSString*) descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
	NSMutableString *indentString = [NSMutableString string];
	NSUInteger i, count = level;
	for (i = 0; i < count; i++)
		[indentString appendFormat:@"    "];
	
	NSMutableString *description = [NSMutableString string];
	[description appendFormat:@"%@{\n", indentString];
	for (NSObject *key in self)
	{
		[description appendFormat:@"%@    %@ = %@;\n",
         indentString,
         DescriptionForObject(key, locale, level),
         DescriptionForObject([self objectForKey:key], locale, level)];
	}
	[description appendFormat:@"%@}\n", indentString];
	return description;
}

@end

NSString *DescriptionForObject(NSObject *object, id locale, NSUInteger indent) {
    
	if ([object isKindOfClass:[NSString class]])
		return (NSString *)object;
    
	if ([object respondsToSelector:@selector(descriptionWithLocale:indent:)])
		return [(NSDictionary *)object descriptionWithLocale:locale indent:indent];
    
	if ([object respondsToSelector:@selector(descriptionWithLocale:)])
		return [(NSSet *)object descriptionWithLocale:locale];
    
	return [object description];
}
