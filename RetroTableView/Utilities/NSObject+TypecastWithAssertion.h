//
//  NSObject+TypecastWithAssertion.h
//  RetroTableView
//
//  Created by Kyaw Zay Ya Lin Tun on 31/05/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (TypecastWithAssertion)
+ (instancetype)typecastWithAssertion:(id)object;
@end


@implementation NSObject (TypecastWithAssertion)

+ (instancetype)typecastWithAssertion:(id)object {
    if (!object)
        NSAssert([object isKindOfClass:[self class]], @"Object %@ is not kind of class %@", object, NSStringFromClass([self class]));
    return object;
}

@end

NS_ASSUME_NONNULL_END
