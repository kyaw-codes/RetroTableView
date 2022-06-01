//
//  TodoVO.h
//  RetroTableView
//
//  Created by Kyaw Zay Ya Lin Tun on 31/05/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, Priority) {
    Low = 0,
    Normal = 1,
    Important = 2
};

@interface TodoVO : NSObject

@property (nonatomic, readonly) NSString *id;
@property (nonatomic) NSString *title;
@property (nonatomic) NSDate *createdDateTime;
@property (nonatomic) Priority priority;
@property (nonatomic) BOOL isCompleted;

- initWithTitle:(NSString *)title createdDateTime:(NSDate *)dateTime setPriorityTo:(Priority)priority isCompleted:(BOOL)isCompleted;

@end


NS_ASSUME_NONNULL_END
