//
//  RPReflection.h
//  CardBuilder
//
//  Created by Andre Leite on 4/12/16.
//  Copyright © 2016 RentPath. All rights reserved.
//

@import Foundation;

@interface RPValidationReflection : NSObject

+ (NSArray *)getSubclasses:(Class) class;
+ (id)createObject:(Class) class initializer:(SEL)initializer argument:(id)argument;
+ (id)createObject:(Class) class;

@end