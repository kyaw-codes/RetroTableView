//
//  ViewController.m
//  RetroTableView
//
//  Created by Kyaw Zay Ya Lin Tun on 31/05/2022.
//

#import "ViewController.h"
#import "EditViewController.h"
#import "TodoCell.h"
#import "NSObject+TypecastWithAssertion.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) TodoManager *manager;

- (void)setupTableView;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _manager = [TodoManager sharedInstance];
        [_manager simulateSetup];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self setupTableView];
}

- (void)setupTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [_tableView registerNib:[UINib nibWithNibName:@"TodoCell" bundle:nil]
     forCellReuseIdentifier:@"Cell"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [_tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [_tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [_tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [_tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_manager noOfTodos];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoCell *cell = [TodoCell typecastWithAssertion:[tableView dequeueReusableCellWithIdentifier:@"Cell"]];
    [cell configureCellWithVo:[_manager getTodoAtIndex:indexPath.row]];
    return cell;
}

- (IBAction)handlePlusButtonTapped:(UIBarButtonItem *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EditViewController *editVC = [storyboard instantiateViewControllerWithIdentifier:@"EditViewController"];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:editVC];
    
    [self.navigationController presentViewController:navVC animated:YES completion:nil];
}

@end
