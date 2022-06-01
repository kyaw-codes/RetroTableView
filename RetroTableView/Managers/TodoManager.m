//
//  TodoManager.m
//  RetroTableView
//
//  Created by Kyaw Zay Ya Lin Tun on 31/05/2022.
//

#import "TodoManager.h"

@interface TodoManager()
@property (nonatomic) NSMutableArray<TodoVO *> *todos;
@end

@implementation TodoManager

# pragma mark - Initializer
- (instancetype)init {
    if (self = [super init]) {
        _todos = [[NSMutableArray alloc] init];
    }
    return self;
}

# pragma mark - CRUD operation

- (TodoVO *)getTodoAtIndex:(long)index {
    return _todos[index];
}

- (void)simulateSetup {
    TodoVO *todoOne = [[TodoVO alloc] initWithTitle:@"Learn Objective C" createdDateTime:[NSDate date] setPriorityTo:Important isCompleted:YES];
    TodoVO *todoTwo = [[TodoVO alloc] initWithTitle:@"Make some video" createdDateTime:[NSDate date] setPriorityTo:Normal isCompleted:YES];
    TodoVO *todoThree = [[TodoVO alloc] initWithTitle:@"Do some cardio" createdDateTime:[NSDate date] setPriorityTo:Low isCompleted:NO];
    
    if (!_todos) { _todos = [[NSMutableArray alloc] init]; }
    
    [_todos addObject:todoOne];
    [_todos addObject:todoTwo];
    [_todos addObject:todoThree];
}

- (void)saveTodo:(TodoVO *)vo {
    [_todos addObject:vo];
}

- (void)deleteTodo:(NSString *)id {
    for (int i = 0; i < [_todos count]; i++) {
        if (_todos[i].id == id) {
            [_todos removeObjectAtIndex:i];
            break;
        }
    }
}

- (NSInteger)noOfTodos {
    return _todos.count;
}

# pragma mark - Singleton object creation

+ (TodoManager *)sharedInstance {
    static TodoManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TodoManager alloc] init];
    });
    return manager;
}

@end
