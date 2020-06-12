//
//  CBStuEvaluationController.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBStuEvaluationController.h"
#import "CBMoralEvlController.h"
#import "CBClassEvlController.h"

@interface CBStuEvaluationController ()

@property (nonatomic, copy) NSArray *titleArr;
@property (nonatomic, copy) NSArray *controllerNames;


@end

@implementation CBStuEvaluationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"评级";
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 60, 0, 0);
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.titleArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *controllerName = self.controllerNames[indexPath.row];
    BaseController *vc = [NSClassFromString(controllerName) new];
    vc.title = self.titleArr[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"德育评价", @"课堂评价"];
    }
    return _titleArr;
}

- (NSArray *)controllerNames {
    if (!_controllerNames) {
       _controllerNames =  @[@"CBMoralEvlController", @"CBClassEvlController"];
    }
    return _controllerNames;
}

@end
