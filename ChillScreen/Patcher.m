//    Created by Mark Matviiv on 20.12.2019.
//    Copyright © 2019 Mark Matviiv. MIT License.

#import "Patcher.h"


@implementation Patcher

+ (void)patch {
    NSError * __autoreleasing error;
    
    NSString *name = [self original:NSStringFromClass(self)];
    if(!name) return;
    
    Class class = NSClassFromString(name);
    [class jrlp_addMethodsFromClass:self error:&error];
    
    [self patch:class with:self error:&error];
    [self patch:class with:object_getClass(self) error:&error];
    
    Log(@"patched %@", class);
}

+ (void)patch:(Class)class with:(Class)with error:(NSError **)error {
    unsigned int count;
    Method *methods = class_copyMethodList(with, &count);
    
    for (unsigned int i = 0; i < count; i++) {
        SEL original = [self originalSel:method_getName(methods[i])];
        if(!original) continue;
        
        SEL patched = method_getName(methods[i]);
        
        if(![class jrlp_swizzleMethod:original withMethod:patched error:error]) {
            [class jrlp_swizzleClassMethod:original withClassMethod:patched error:error];
        }
    }
    
    free(methods);
}

+ (SEL)originalSel:(SEL)name {
    NSString *selName = NSStringFromSelector(name);

    return NSSelectorFromString([self original:selName]);
}

+ (NSString *)original:(NSString *)name {
    if(![name hasPrefix:@"CS_"])
        return nil;

    return [name stringByReplacingOccurrencesOfString:@"CS_" withString:@""];
}

@end
