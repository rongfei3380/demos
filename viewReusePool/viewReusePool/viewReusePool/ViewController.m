//
//  ViewController.m
//  viewReusePool
//
//  Created by chengfei on 2019/2/27.
//  Copyright © 2019 chengfeir. All rights reserved.
//

#import "ViewController.h"
#import "IndexedTableView.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, IndexedTablewViewDataSource>{
    IndexedTableView *tableView;
    UIButton *refreshButton;
    NSMutableArray *dataSource;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    创建tableview
    tableView = [[IndexedTableView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height -60) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.indexedDataSource = self;
    [self.view addSubview:tableView];
    
//    创建刷新的 button按钮
    refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    refreshButton.frame = CGRectMake(0, 20, self.view.frame.size.width, 40);
    refreshButton.backgroundColor = [UIColor redColor];
    [refreshButton setTitle:@"reloadTable" forState:UIControlStateNormal];
    [refreshButton addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:refreshButton];
    
    // 数据源
    dataSource = [NSMutableArray array];
    for (int i = 0 ; i < 100; i++) {
        [dataSource addObject:@(i+1)];
    }
}

- (void)doAction:(id)sender {
    [tableView reloadData];
}

#pragma mark IndexedTablewViewDataSource

- (NSArray <NSString *>*)indexTitlesForIndexTableView:(UITableView *)tableView {
    static BOOL change = false;
    
    if (change) {
        change = NO;
        return @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K"];
    } else {
        change = true;
        return @[@"A", @"B", @"C", @"D", @"E", @"F"];
    }
}

#pragma mark- UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"reuseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [[dataSource objectAtIndex:indexPath.row] stringValue];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataSource count];
}
#pragma mark- UITableViewDelegate


@end
