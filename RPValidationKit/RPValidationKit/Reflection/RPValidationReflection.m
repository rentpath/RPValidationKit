//
//  RPValidationReflection.m
//  CardBuilder
//
//  Created by Andre Leite on 4/12/16.
//  Copyright © 2016 RentPath. All rights reserved.
//

#import "RPValidationReflection.h"
#import <objc/runtime.h>

@implementation RPValidationReflection

+ (NSArray *)getSubclasses:(Class) class {
    int numClasses = objc_getClassList(NULL, 0);
    Class *classes = NULL;
    
    classes = (__unsafe_unretained Class *) malloc(sizeof(Class) * numClasses);
    numClasses = objc_getClassList(classes, numClasses);
    
    NSMutableArray *result = [NSMutableArray array];
    for (NSInteger i = 0; i < numClasses; i++) {
        Class superClass = classes[i];
        do{
            superClass = class_getSuperclass(superClass);
        } while(superClass && superClass != class);
        
        if (superClass == nil) {
            continue;
        }
        [result addObject:classes[i]];
    }
    free(classes);
    return result;
}

+ (id)createObject:(Class) class  {
    return [[class alloc] init];
}

+ (id)createObject:(Class) class initializer:(SEL)initializer argument:(id)argument {
    id target = [class alloc];
    IMP imp = [target methodForSelector:initializer];
    id (*initFunc)(id, SEL, id) = (void *)imp;
    return initFunc(target, initializer, argument);
}


@end
