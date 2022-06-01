//
//  TodoVO.m
//  RetroTableView
//
//  Created by Kyaw Zay Ya Lin Tun on 31/05/2022.
//

#import "TodoVO.h"

@implementation TodoVO

- (id)initWithTitle:(NSString *)title
    createdDateTime:(NSDate *)dateTime
      setPriorityTo:(Priority)priority
        isCompleted:(BOOL)isCompleted {
    
    if (self = [super init]) {
        _id = [[NSUUID alloc] init].UUIDString;
        _title = title;
        _createdDateTime = dateTime;
        _priority = priority;
        _isCompleted = isCompleted;
    }
    
    return self;
}
@end
