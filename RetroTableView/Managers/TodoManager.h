//
//  TodoManager.h
//  RetroTableView
//
//  Created by Kyaw Zay Ya Lin Tun on 31/05/2022.
//

#import <Foundation/Foundation.h>
#import "TodoVO.h"

NS_ASSUME_NONNULL_BEGIN

@interface TodoManager : NSObject

- (void)simulateSetup;
- (TodoVO *)getTodoAtIndex:(long)index;
- (void)saveTodo:(TodoVO *)vo;
- (void)deleteTodo:(NSString *)id;
- (NSInteger)noOfTodos;

+ (TodoManager *)sharedInstance;

@end

NS_ASSUME_NONNULL_END
