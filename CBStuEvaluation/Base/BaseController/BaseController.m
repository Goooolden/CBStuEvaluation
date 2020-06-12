//
//  BaseController.m
//  CBStuManagement
//
//  Created by LANXUM on 2018/10/23.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title.copy;
    }
    return self;
}

@end
